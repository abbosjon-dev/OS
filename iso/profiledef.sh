#!/usr/bin/env bash
# mkarchiso profile for ZaminOS — Arch Linux ARM (aarch64) for PinePhone.
# Run from a host with arch-install-scripts + qemu-user-static-binfmt installed.

iso_name="zaminos"
iso_label="ZAMINOS_$(date +%Y%m)"
iso_publisher="ZaminOS <https://github.com/abbosjon-dev/os>"
iso_application="ZaminOS Live/Installer (PinePhone aarch64)"
iso_version="$(date +%Y.%m.%d)"
install_dir="zamin"
buildmodes=('iso')
bootmodes=('uboot.aarch64')
arch="aarch64"
pacman_conf="pacman.conf"
airootfs_image_type="erofs"
airootfs_image_tool_options=('-zlz4hc,9' '-E' 'ztailpacking')
file_permissions=(
  ["/etc/shadow"]="0:0:0400"
  ["/usr/local/bin/zamin-firstboot"]="0:0:0755"
)
