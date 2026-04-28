//! ZaminOS form-factor daemon.
//!
//! Watches udev for external displays, keyboards and mice. When the device set
//! crosses the threshold for "desktop usage" it broadcasts a D-Bus signal that
//! the shell listens for; the shell then swaps its root component between
//! `MobileShell.qml` and `DesktopShell.qml`.

use std::time::Duration;

use tokio::sync::watch;
use tokio::time::sleep;
use tracing::{info, warn};
use zbus::{interface, ConnectionBuilder, SignalContext};

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum Mode {
    Mobile,
    Desktop,
}

impl Mode {
    fn as_str(self) -> &'static str {
        match self {
            Mode::Mobile => "mobile",
            Mode::Desktop => "desktop",
        }
    }
}

#[derive(Default, Debug, Clone)]
struct Inputs {
    external_display: bool,
    keyboard: bool,
    pointer: bool,
}

impl Inputs {
    /// Desktop is engaged when the user has both a way to look at and a way to
    /// drive the system that is not the built-in touchscreen.
    fn mode(&self) -> Mode {
        if self.external_display && (self.keyboard || self.pointer) {
            Mode::Desktop
        } else {
            Mode::Mobile
        }
    }
}

struct ShellBridge {
    tx: watch::Sender<Mode>,
}

#[interface(name = "org.zaminos.FormFactor1")]
impl ShellBridge {
    /// Current mode, queried at startup by the shell.
    #[zbus(property)]
    fn mode(&self) -> String {
        self.tx.borrow().as_str().to_string()
    }

    /// Emitted whenever the mode changes.
    #[zbus(signal)]
    async fn mode_changed(ctx: &SignalContext<'_>, mode: &str) -> zbus::Result<()>;
}

async fn scan_inputs() -> Inputs {
    // Real implementation enumerates udev for `drm` (external connectors with
    // status="connected") and `input` (ID_INPUT_KEYBOARD / ID_INPUT_MOUSE).
    // Skeleton stub so the daemon compiles end-to-end.
    Inputs::default()
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    tracing_subscriber::fmt::init();
    info!("zamin-formfactord starting");

    let (tx, mut rx) = watch::channel(Mode::Mobile);
    let bridge = ShellBridge { tx: tx.clone() };

    let conn = ConnectionBuilder::session()?
        .name("org.zaminos.FormFactor")?
        .serve_at("/org/zaminos/FormFactor", bridge)?
        .build()
        .await?;

    let iface_ref = conn
        .object_server()
        .interface::<_, ShellBridge>("/org/zaminos/FormFactor")
        .await?;

    tokio::spawn(async move {
        loop {
            let mode = scan_inputs().await.mode();
            if *tx.borrow() != mode {
                let _ = tx.send(mode);
            }
            sleep(Duration::from_millis(500)).await;
        }
    });

    while rx.changed().await.is_ok() {
        let mode = *rx.borrow();
        info!(?mode, "form factor changed");
        let ctx = iface_ref.signal_context();
        if let Err(e) = ShellBridge::mode_changed(ctx, mode.as_str()).await {
            warn!("failed to emit mode_changed: {e}");
        }
    }

    Ok(())
}
