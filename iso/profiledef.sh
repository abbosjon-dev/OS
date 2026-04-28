#!/usr/bin/env bash
# ZaminOS — Zamin Phone uchun yuklanadigan tasvirni yig'ish profili.

iso_name="zaminos"
iso_label="ZAMINOS_$(date +%Y%m)"
iso_publisher="ZaminOS <https://zaminos.uz>"
iso_application="ZaminOS — Zamin Phone uchun"
iso_version="$(date +%Y.%m.%d)"
install_dir="zamin"
buildmodes=('iso')
pacman_conf="pacman.conf"
airootfs_image_type="erofs"
airootfs_image_tool_options=('-zlz4hc,9' '-E' 'ztailpacking')
file_permissions=(
  ["/etc/shadow"]="0:0:0400"
  ["/usr/local/bin/zamin-firstboot"]="0:0:0755"
)
