#!/bin/bash
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git passwallPackages https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default
echo 'src-git mosdns https://github.com/QiuSimons/openwrt-mos' >>feeds.conf.default

# 【修改为标准的安全写法】：将第三方包克隆到 package/custom 目录下
mkdir -p package/custom

# 添加 smartdns 核心
git clone --depth=1 -b master https://github.com/pymumu/openwrt-smartdns package/custom/smartdns

# 添加 luci-app-smartdns (使用 lede 分支)
git clone --depth=1 -b master https://github.com/pymumu/luci-app-smartdns package/custom/luci-app-smartdns
