[简体中文](./README.md) | English

# Xiaomi AX3000T V1 · OpenWrt Firmware

[![Build OpenWrt](https://github.com/ninesun99/6.12-AX3000T-OpenWrt-New/actions/workflows/build-openwrt.yml/badge.svg)](https://github.com/ninesun99/6.12-AX3000T-OpenWrt-New/actions/workflows/build-openwrt.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

OpenWrt firmware built for the Xiaomi Router AX3000T (V1), automatically compiled every day by GitHub Actions, ready to flash.

## Based on

- Source: [ImmortalWrt 25.12](https://github.com/chasey-dev/immortalwrt-mt798x-rebase) (chasey-dev's MT798x rebase branch), Linux kernel 6.12
- Device: Xiaomi AX3000T V1 (MT7981, MediaTek Filogic platform, stock partition layout)
- V1 only. Do not flash this on the V2 model, it may brick the device.

## Features

- Closed-source WiFi driver (mt_wifi), required for WiFi to work on kernel 6.12
- Turbo ACC MTK hardware acceleration and EQoS smart bandwidth control
- Argon theme (default) with the Argon config plugin
- zram memory compression, eases pressure on the 256MB RAM
- USB 3.0 / 2.0, USB storage and automount
- Web terminal (ttyd), run commands right from the browser
- SmartDNS with dnsmasq-full
- UPnP automatic port mapping
- Full Cone NAT (nft-fullcone), improves NAT type for console gaming and PT downloads
- IPv6 works out of the box
- Auto reboot, memory cleaner and other daily maintenance plugins
- Default admin address `192.168.8.1`, username `root`, no password (set one right after the first login)
- Attended sysupgrade (online upgrade) removed, so a closed-source-driver build cannot be bricked by an accidental online upgrade

## Quick start

Download the latest firmware from [Releases](https://github.com/ninesun99/6.12-AX3000T-OpenWrt-New/releases) and flash the `squashfs-sysupgrade` image. If that fails, flash the `initramfs-kernel` image first, then upgrade to the `squashfs-sysupgrade` image from the web interface.

- [Flashing guide: unlock SSH, flash U-Boot and firmware](Flash-document.md)
- [Restore the stock Xiaomi firmware](BackXiaomi.md)

> Note: unlocking SSH requires the stock firmware version to be 1.0.47 or lower. On a higher version, downgrade with Xiaomi's unbrick tool first.

## Daily automated builds

- Builds run automatically every day at 08:00 Beijing time. Successful builds are published to Releases, keeping the latest 30, tagged with the build date (for example `2026.11.09-0800`).
- You can also trigger a build manually in Actions: open the `Build OpenWrt` workflow and click `Run workflow`.

## Customize your own build

- Edit `.config` to add or remove packages and features (the file has Chinese comments marking which lines are safe to change).
- Edit `diy-part1.sh` / `diy-part2.sh` for the default IP, default theme and other system-level tweaks.
- Edit `.github/workflows/build-openwrt.yml` for the build schedule and release policy.
- Push a change and a new build starts automatically. You can also fork this repo and build manually in your own Actions.

## Credits

- [ImmortalWrt](https://github.com/immortalwrt/immortalwrt) and [OpenWrt](https://github.com/openwrt/openwrt)
- Upstream source [chasey-dev/immortalwrt-mt798x-rebase](https://github.com/chasey-dev/immortalwrt-mt798x-rebase)
- Workflow template from [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

## License

[MIT](LICENSE)
