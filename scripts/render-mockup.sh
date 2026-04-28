#!/usr/bin/env bash
# ZaminOS qobiq dizaynini PNG tasvirlarga chiqarish — Zamin Phone'ga
# yuborishdan oldin dizaynni ko'rib chiqish uchun.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

# OpenGL via llvmpipe so the supersampled output is crisp.
export QT_QPA_PLATFORM=xcb
export LIBGL_ALWAYS_SOFTWARE=1
export GALLIUM_DRIVER=llvmpipe
unset QSG_RHI_BACKEND QT_QUICK_BACKEND

xvfb-run -a -s "-screen 0 3072x2048x24 +extension GLX +render -noreset" \
    python3 shell/preview/render.py
