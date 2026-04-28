#!/usr/bin/env python3
"""Render ZaminOS shell QML to PNG screenshots (mobile + desktop modes)."""
import sys
from pathlib import Path
from PySide6.QtCore import QUrl, QTimer, Qt
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QQmlComponent
from PySide6.QtQuick import QQuickView, QQuickWindow, QSGRendererInterface

QML_DIR = Path(__file__).resolve().parent.parent / "qml"
OUT_DIR = Path(__file__).resolve().parent / "out"
OUT_DIR.mkdir(parents=True, exist_ok=True)

CASES = [
    ("mobile",  540, 1080, "Mobile (PinePhone portrait)"),
    ("desktop", 1280, 720, "Desktop (HDMI ulangan)"),
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
    root = view.rootObject()
    root.setProperty("mode", mode)
    view.show()

    out_path = OUT_DIR / f"zaminos-{mode}.png"
    done = {"ok": False}

    def grab():
        # Force a render then grab framebuffer
        img = view.grabWindow()
        img.save(str(out_path), "PNG")
        done["ok"] = True
        QGuiApplication.instance().quit()

    QTimer.singleShot(800, grab)
    QGuiApplication.instance().exec()
    view.close()
    view.deleteLater()
    return out_path if done["ok"] else None


def main():
    QQuickWindow.setGraphicsApi(QSGRendererInterface.Software)  # no GPU needed
    app = QGuiApplication(sys.argv)
    for mode, w, h, label in CASES:
        out = render(mode, w, h)
        if out and out.exists():
            print(f"✓ {label:38s} → {out}  ({out.stat().st_size//1024} KB)")
        else:
            print(f"✗ {label} failed", file=sys.stderr)
            sys.exit(1)


if __name__ == "__main__":
    main()
