#!/bin/bash
# ============================================================
# diy-part2.sh —— 在"安装feeds"之后、"编译"之前自动运行
# 你不用懂，整段覆盖即可
# ============================================================

# ① 把后台默认 IP 从 192.168.1.1 改成 192.168.8.1
#    （6.12 源码默认就是 192.168.1.1，所以这行能生效）
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# ② 把默认主题改成更好看的 Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# ③ 去掉"智能辅助系统更新"（在线升级工具）
#    这种闭源驱动固件用不了它，留着怕你以后点错在线升级变砖，所以删掉
sed -i 's/ \+luci-app-attendedsysupgrade//g' feeds/luci/collections/luci/Makefile
sed -i 's/+luci-app-attendedsysupgrade//g' feeds/luci/collections/luci/Makefile

# ④ 用 6.12 源码自带的 defconfig 当"基底配置"
#    （这个基底里有正确的平台设置和闭源驱动框架）
mv .config .config.bak
cp -f defconfig/mt7981-ax3000.config .config

# ⑤ 删掉基底里所有设备，只保留"小米 AX3000T（stock 分区）"
sed -i '/CONFIG_TARGET_DEVICE_/d' .config
echo "CONFIG_TARGET_DEVICE_mediatek_filogic_DEVICE_xiaomi_mi-router-ax3000t=y" >> .config

# ⑥ 把你上面 .config 里写的所有包（闭源驱动、USB、个人定制等）追加进来
grep -E '=y$|=m$' .config.bak | grep -v 'CONFIG_TARGET_' >> .config
