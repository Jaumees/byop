#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# 注意：务必加上 .git 后缀，以及显式指定 ;main 或 ;master 分支
echo 'src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main' >> feeds.conf.default
echo 'src-git passwall_luci https://github.com/Openwrt-Passwall/openwrt-passwall.git;main' >> feeds.conf.default
echo 'src-git mosdns https://github.com/QiuSimons/openwrt-mos.git;master' >> feeds.conf.default

# =========================================================
# 添加自定义插件 (不放入 feeds，放入 package/custom 避免冲突)
# =========================================================
mkdir -p package/custom

# 添加 smartdns 核心
git clone --depth=1 -b master https://github.com/pymumu/openwrt-smartdns package/custom/smartdns

# 添加 luci-app-smartdns (使用 lede 分支以适配 coolsnowwolf/lede 源码)
git clone --depth=1 -b master https://github.com/pymumu/luci-app-smartdns package/custom/luci-app-smartdns
