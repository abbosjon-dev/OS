#!/usr/bin/env bash
# Flash the freshly-built ZaminOS image to a microSD card or to the PinePhone's
# internal eMMC (when the phone is in Jumpdrive mode).
set -euo pipefail

usage() {
  echo "Usage: $0 <image.iso|.img> <device>"
  echo "Example: $0 out/zaminos-2026.04.iso /dev/sdX"
  exit 1
}

[[ $# -eq 2 ]] || usage
IMG="$1"
DEV="$2"

[[ -f "$IMG" ]] || { echo "image not found: $IMG" >&2; exit 1; }
[[ -b "$DEV" ]] || { echo "device not found: $DEV" >&2; exit 1; }

if mount | grep -q "^${DEV}"; then
  echo "Refusing to flash: $DEV has mounted partitions" >&2
  exit 1
fi

read -r -p "About to overwrite ${DEV}. Type 'YES' to continue: " confirm
[[ "$confirm" == "YES" ]] || { echo "aborted"; exit 1; }

dd if="$IMG" of="$DEV" bs=4M status=progress conv=fsync
sync
echo "done — eject ${DEV} and boot the PinePhone"
