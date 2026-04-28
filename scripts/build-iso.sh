#!/usr/bin/env bash
# Build the ZaminOS bootable image for PinePhone (aarch64).
# Requires: archlinux host, arch-install-scripts, qemu-user-static-binfmt,
# and the archiso package (provides mkarchiso).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="${ROOT}/out"
WORK="${ROOT}/.work"

if [[ "$(id -u)" -ne 0 ]]; then
  echo "build-iso.sh must run as root (mkarchiso needs to chroot)" >&2
  exit 1
fi

if ! command -v mkarchiso >/dev/null; then
  echo "mkarchiso not found — install the 'archiso' package" >&2
  exit 1
fi

mkdir -p "${OUT}" "${WORK}"
cd "${ROOT}/iso"

mkarchiso -v -w "${WORK}" -o "${OUT}" .

echo
echo "Built image:"
ls -lh "${OUT}"/*.iso
