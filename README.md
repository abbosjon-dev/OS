# ZaminOS

A convergent Linux distribution for the **PinePhone** (Arch Linux ARM /
aarch64). One installation that adapts between phone and desktop:

- **Mobile mode** — touch-first home screen, on-screen keyboard, dock.
- **Desktop mode** — top panel, floating windows, taskbar — automatically
  switched in when an external monitor + keyboard/mouse is connected.

> *Zamin* (Uzbek: "earth, ground") — the foundation under everything you do
> with your device.

## Status

Pre-alpha. The convergent shell is implemented as a QML mockup. The
form-factor daemon, mkarchiso profile and kernel notes are scaffolded.

## Repository layout

| Path           | Purpose                                            |
|----------------|----------------------------------------------------|
| `iso/`         | mkarchiso profile that builds the bootable image   |
| `packages/`    | PKGBUILDs for ZaminOS-specific pacman packages     |
| `shell/`       | Qt6 + QML convergent shell                         |
| `formfactord/` | Rust daemon that picks mobile vs. desktop          |
| `kernel/`      | PinePhone kernel notes + config                    |
| `scripts/`     | `build-iso.sh`, `flash-pinephone.sh`, …            |
| `docs/`        | Architecture docs                                  |

See [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) for how the pieces fit.

## UI preview

The shell can be rendered without a phone — it draws a software-rasterised
preview straight to PNG so you can iterate on the design from any laptop:

```bash
./scripts/render-mockup.sh
# → shell/preview/out/zaminos-mobile.png
# → shell/preview/out/zaminos-desktop.png
```

| Mobile (PinePhone portrait)                           | Desktop (HDMI ulangan)                               |
|-------------------------------------------------------|------------------------------------------------------|
| ![mobile](shell/preview/out/zaminos-mobile.png)       | ![desktop](shell/preview/out/zaminos-desktop.png)    |

## Building the image (Arch host)

```bash
sudo pacman -S archiso arch-install-scripts qemu-user-static-binfmt
sudo ./scripts/build-iso.sh
sudo ./scripts/flash-pinephone.sh out/zaminos-*.iso /dev/sdX
```

## License

GPL-3.0-or-later.
