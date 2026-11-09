简体中文 | [English](./README_EN.md)

# 小米 AX3000T V1 · OpenWrt 固件

[![Build OpenWrt](https://github.com/ninesun99/6.12-AX3000T-OpenWrt-New/actions/workflows/build-openwrt.yml/badge.svg)](https://github.com/ninesun99/6.12-AX3000T-OpenWrt-New/actions/workflows/build-openwrt.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

为小米路由器 AX3000T（V1 版）打造的 OpenWrt 固件，由 GitHub Actions 每天自动云编译，开箱即用。

## 基于

- 源码：[ImmortalWrt 25.12](https://github.com/chasey-dev/immortalwrt-mt798x-rebase)（chasey-dev 的 MT798x 重构分支），内核 6.12
- 机型：小米 AX3000T V1（MT7981，MediaTek Filogic 平台，stock 分区）
- 仅支持 V1，V2 机型请勿刷入，否则可能变砖

## 特性

- 闭源 WiFi 驱动（mt_wifi），6.12 内核下 WiFi 正常工作的必需组件
- Turbo ACC MTK 硬件加速 + EQoS 智能限速
- Argon 主题（默认）及 Argon 配置插件
- zram 内存压缩，缓解 256MB 小内存压力
- USB 3.0 / 2.0、USB 存储及自动挂载
- 网页终端（ttyd），浏览器里直接敲命令
- SmartDNS + dnsmasq-full
- UPnP 端口自动映射
- Full Cone NAT（nft-fullcone），改善主机游戏联机与 PT 下载的 NAT 类型
- IPv6 开箱即用
- 自动重启、内存清理等日常维护插件
- 默认后台地址 `192.168.8.1`，用户名 `root`，密码为空（首次登录后请立即设置密码）
- 已移除在线升级（attendedsysupgrade），避免闭源驱动固件误点在线升级变砖

## 快速开始

到 [Releases](https://github.com/ninesun99/6.12-AX3000T-OpenWrt-New/releases) 下载最新固件，刷入 `squashfs-sysupgrade` 格式即可；如果刷不上去，先刷 `initramfs-kernel`，再进后台升级为 `squashfs-sysupgrade` 格式。

- [刷机教程：解锁 SSH、刷入 U-Boot 与固件](Flash-document.md)
- [刷回小米官方固件](BackXiaomi.md)

> 注意：解锁 SSH 要求官方固件版本不高于 1.0.47，高于此版本请先用小米救砖工具降级。

## 每天自动编译

- 每天北京时间 08:00 自动触发编译，成功后自动发布到 Releases，保留最新 30 个版本，发布标签为编译日期（如 `2026.11.09-0800`）
- 也可以在 Actions 里手动触发：打开 `Build OpenWrt` 工作流，点 `Run workflow`

## 自己定制

- 改 `.config`：增删软件包与功能（文件里有中文注释，标明了哪些行可以动）
- 改 `diy-part1.sh` / `diy-part2.sh`：改默认 IP、默认主题、增删系统级调整
- 改 `.github/workflows/build-openwrt.yml`：改编译触发时间、发布策略
- 改完提交后就会按新配置自动编译；也可以 fork 本仓库后在自己的 Actions 里手动编译

## 致谢

- [ImmortalWrt](https://github.com/immortalwrt/immortalwrt) 与 [OpenWrt](https://github.com/openwrt/openwrt)
- 上游源码 [chasey-dev/immortalwrt-mt798x-rebase](https://github.com/chasey-dev/immortalwrt-mt798x-rebase)
- 工作流模板来源 [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

## 许可证

[MIT](LICENSE)
