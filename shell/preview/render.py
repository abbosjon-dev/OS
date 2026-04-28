#!/usr/bin/env python3
"""ZaminOS qobiq dizaynini PNG tasvirlarga chiqarish (mobile + desktop).

Renders the QML shell using OpenGL via llvmpipe inside Xvfb. The QML works in
its declared logical pixels and is rendered at the same resolution to PNG —
crispness comes from MSAA + native-rendered text rather than from supersampling
the scene size.
"""
import sys
from pathlib import Path

from PySide6.QtCore import QUrl, QTimer, Qt
from PySide6.QtGui import QGuiApplication, QSurfaceFormat
from PySide6.QtQuick import QQuickView, QQuickWindow, QSGRendererInterface

QML_DIR = Path(__file__).resolve().parent.parent / "qml"
OUT_DIR = Path(__file__).resolve().parent / "out"
OUT_DIR.mkdir(parents=True, exist_ok=True)

CASES = [
    ("mobile",        390, 844,  "Zamin Phone — bosh ekran"),
    ("controlcenter", 390, 844,  "Zamin Phone — boshqaruv markazi"),
    ("desktop",       1280, 800, "Zamin Phone — desktop rejim"),
    ("spotlight",     1280, 800, "Zamin Phone — qidiruv"),
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
    for mode, w, h, label in CASES:
        out = render(mode, w, h)
        if out and out.exists():
            kb = out.stat().st_size // 1024
            print(f"✓ {label:38s} → {out}  ({kb} KB)")
        else:
            print(f"✗ {label} failed", file=sys.stderr)
            sys.exit(1)


if __name__ == "__main__":
    main()
