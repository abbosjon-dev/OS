#!/usr/bin/env bash
# ZaminOS — Zamin Phone uchun yuklanadigan tasvirni yig'ish.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="${ROOT}/out"
WORK="${ROOT}/.work"

if [[ "$(id -u)" -ne 0 ]]; then
  echo "build-iso.sh root sifatida ishga tushirilishi kerak" >&2
  exit 1
fi

if ! command -v mkarchiso >/dev/null; then
  echo "Yig'ish vositasi topilmadi — yig'ish muhitini tayyorlang" >&2
  exit 1
fi

mkdir -p "${OUT}" "${WORK}"
cd "${ROOT}/iso"

mkarchiso -v -w "${WORK}" -o "${OUT}" .

echo
echo "Tayyor tasvir:"
ls -lh "${OUT}"/*.iso
