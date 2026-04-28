#!/usr/bin/env bash
# ZaminOS tasvirini Zamin Phone ichki xotirasiga yoki tashqi xotira kartasiga yozish.
set -euo pipefail

usage() {
  echo "Foydalanish: $0 <tasvir.iso|.img> <qurilma>"
  echo "Misol:       $0 out/zaminos-2026.04.iso /dev/sdX"
  exit 1
}

[[ $# -eq 2 ]] || usage
IMG="$1"
DEV="$2"

[[ -f "$IMG" ]] || { echo "tasvir topilmadi: $IMG" >&2; exit 1; }
[[ -b "$DEV" ]] || { echo "qurilma topilmadi: $DEV" >&2; exit 1; }

if mount | grep -q "^${DEV}"; then
  echo "Xavfsizlik: ${DEV} ulangan bo'limlari bor — yozish to'xtatildi" >&2
  exit 1
fi

read -r -p "${DEV} qurilmasi to'liq qayta yoziladi. Davom etish uchun 'YES' deb yozing: " confirm
[[ "$confirm" == "YES" ]] || { echo "bekor qilindi"; exit 1; }

dd if="$IMG" of="$DEV" bs=4M status=progress conv=fsync
sync
echo "tayyor — ${DEV} ni chiqarib oling va Zamin Phone'ni yoqing"
