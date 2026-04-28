#!/usr/bin/env python3
"""Render every ZaminOS screen to an individual PNG.

Uses OpenGL via llvmpipe inside Xvfb. The QML works in its declared logical
pixels and is rendered at the same resolution to PNG — crispness comes from
MSAA + native-rendered text.
"""
import sys
from pathlib import Path

from PySide6.QtCore import QUrl, QTimer, Qt
from PySide6.QtGui import QGuiApplication, QSurfaceFormat
from PySide6.QtQuick import QQuickView

QML_DIR = Path(__file__).resolve().parent.parent / "qml"
OUT_DIR = Path(__file__).resolve().parent / "out"
OUT_DIR.mkdir(parents=True, exist_ok=True)

PHONE = (390, 844)
DESK  = (1280, 800)

CASES = [
    # mode             size    label
    ("lockscreen",     PHONE, "Lockscreen"),
    ("home",           PHONE, "Home screen"),
    ("notifications",  PHONE, "Notification center"),
    ("controlcenter",  PHONE, "Control center"),
    ("appswitcher",    PHONE, "App switcher"),
    ("settings",       PHONE, "Settings"),
    ("settings-wifi",  PHONE, "Settings — Wi-Fi"),
    ("phonecall",      PHONE, "Phone call"),
    ("keyboard",       PHONE, "Keyboard / Messages"),
    ("calculator",     PHONE, "Calculator"),
    ("notes",          PHONE, "Notes"),
    ("desktop",        DESK,  "Desktop"),
    ("spotlight",      DESK,  "Spotlight"),
]


def render(mode: str, w: int, h: int) -> Path:
    view = QQuickView()
    view.setResizeMode(QQuickView.SizeRootObjectToView)
    view.setColor(Qt.black)
    view.resize(w, h)
    view.engine().addImportPath(str(QML_DIR))
    view.setSource(QUrl.fromLocalFile(str(QML_DIR / "Main.qml")))
    if view.status() != QQuickView.Ready:
        for err in view.errors():
            print("QML error:", err.toString(), file=sys.stderr)
        sys.exit(2)
    view.rootObject().setProperty("mode", mode)
    view.show()

    out_path = OUT_DIR / f"zaminos-{mode}.png"
    done = {"ok": False}

    def grab():
        view.grabWindow().save(str(out_path), "PNG")
        done["ok"] = True
        QGuiApplication.instance().quit()

    QTimer.singleShot(900, grab)
    QGuiApplication.instance().exec()
    view.close()
    view.deleteLater()
    return out_path if done["ok"] else None


def main():
    fmt = QSurfaceFormat()
    fmt.setSamples(4)
    fmt.setDepthBufferSize(24)
    fmt.setStencilBufferSize(8)
    QSurfaceFormat.setDefaultFormat(fmt)

    app = QGuiApplication(sys.argv)
    failed = 0
    for mode, (w, h), label in CASES:
        out = render(mode, w, h)
        if out and out.exists():
            kb = out.stat().st_size // 1024
            print(f"✓ {label:32s} → {out.name}  ({kb} KB)")
        else:
            print(f"✗ {label} failed", file=sys.stderr)
            failed += 1
    sys.exit(1 if failed else 0)


if __name__ == "__main__":
    main()
