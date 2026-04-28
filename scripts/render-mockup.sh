#!/usr/bin/env bash
# Render the ZaminOS shell QML mockup to PNG screenshots inside a virtual X
# server. Used for design previews before flashing to real hardware.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

export QT_QPA_PLATFORM=xcb
export QSG_RHI_BACKEND=software
export QT_QUICK_BACKEND=software

xvfb-run -a -s "-screen 0 1600x1200x24" python3 shell/preview/render.py
