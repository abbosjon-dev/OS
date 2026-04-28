#!/usr/bin/env bash
# ZaminOS qobiq dizaynini PNG tasvirlarga chiqarish — Zamin Phone'ga
# yuborishdan oldin dizaynni ko'rib chiqish uchun.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

export QT_QPA_PLATFORM=xcb
export QSG_RHI_BACKEND=software
export QT_QUICK_BACKEND=software

xvfb-run -a -s "-screen 0 1600x1200x24" python3 shell/preview/render.py
