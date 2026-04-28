# ZaminOS kernel notes — PinePhone (Allwinner A64)

ZaminOS uses the megi kernel tree as upstream. Key bits we patch / enable:

| Driver / option        | Why we need it                                    |
|------------------------|---------------------------------------------------|
| `CONFIG_DRM_ANX7688`   | USB-C DisplayPort Alt Mode (external monitor)     |
| `CONFIG_TYPEC_ANX7688` | Negotiates DP-Alt + USB-2 fallback                |
| `CONFIG_DRM_PANEL_HIMAX_HX8394` | Built-in 720x1440 PinePhone display      |
| `CONFIG_USB_DWC3_DUAL_ROLE`     | OTG so a USB hub can be plugged in       |
| `CONFIG_RTL8723CS`     | On-board Wi-Fi/BT                                  |
| `CONFIG_OV5640`        | Rear camera                                        |
| `CONFIG_GC2145`        | Front camera                                       |

## Build

```bash
git clone --depth=1 https://github.com/megous/linux -b orange-pi-6.x kernel/linux
cp kernel/zamin.config kernel/linux/.config
make -C kernel/linux ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- olddefconfig
make -C kernel/linux ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc) Image dtbs modules
```

The resulting `Image` + `sun50i-a64-pinephone-1.2b.dtb` are consumed by the
`iso/` profile when assembling the bootable image.
