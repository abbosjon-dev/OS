# ZaminOS — architecture

ZaminOS is a convergent Linux distribution for the PinePhone. One installation,
two faces:

- **Mobile mode** when the user is holding the phone.
- **Desktop mode** when the phone is docked to a screen, keyboard or mouse.

## Stack

```
┌────────────────────────────────────────────────────────────┐
│  ZaminOS shell  (Qt6 + QML, Kirigami)                      │
│  ─ MobileShell.qml      ─ DesktopShell.qml                 │
└──────────────┬─────────────────────────────────────────────┘
               │ D-Bus  org.zaminos.FormFactor1
┌──────────────┴─────────────────────────────────────────────┐
│  zamin-formfactord  (Rust, libinput + udev)                │
│  watches: drm connectors, input devices                    │
└──────────────┬─────────────────────────────────────────────┘
               │ Wayland
┌──────────────┴─────────────────────────────────────────────┐
│  KWin (Wayland)                                            │
└──────────────┬─────────────────────────────────────────────┘
               │
┌──────────────┴─────────────────────────────────────────────┐
│  Linux kernel (megi tree) + PinePhone DT                   │
│  ─ anx7688 (USB-C DisplayPort Alt Mode)                    │
│  ─ dwc3 dual-role (USB hub support)                        │
└────────────────────────────────────────────────────────────┘
```

## Convergence flow

1. User plugs an HDMI-over-USB-C dock into the PinePhone.
2. Kernel: `anx7688` negotiates DP Alt Mode → a new `drm` connector appears.
3. udev fires `change` on `subsystem=drm` → systemd activates
   `zamin-formfactord.service`.
4. Daemon re-scans inputs, decides `Mode::Desktop`, emits
   `org.zaminos.FormFactor1.ModeChanged("desktop")` on the session bus.
5. Shell receives the signal and swaps its root component from `MobileShell` to
   `DesktopShell`. KWin reconfigures outputs (mirror vs. extend) per user
   preference.
6. Unplugging reverses everything within ~1 s.

## Repository layout

| Path            | What lives here                                              |
|-----------------|--------------------------------------------------------------|
| `iso/`          | mkarchiso profile that produces the bootable image           |
| `packages/`     | PKGBUILDs for our own pacman packages                        |
| `shell/`        | Qt6 + QML convergent shell (source for `zaminos-shell`)      |
| `formfactord/`  | Rust daemon (source for `zaminos-formfactord`)               |
| `kernel/`       | Notes + config for the PinePhone kernel build                |
| `scripts/`      | Developer helpers (`build-iso.sh`, `flash-pinephone.sh`, …)  |
| `docs/`         | Design docs                                                  |
