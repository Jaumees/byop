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
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

#sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g' target/linux/x86/Makefile
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.15//g' target/linux/x86/Makefile

WORKINGDIR="package/smartdnssou"
mkdir $WORKINGDIR -p
wget https://github.com/pymumu/openwrt-smartdns/archive/master.zip -O $WORKINGDIR/master.zip
wget https://github.com/pymumu/luci-app-smartdns/archive/lede.zip -O $WORKINGDIR/lede.zip
unzip $WORKINGDIR/master.zip -d $WORKINGDIR
unzip $WORKINGDIR/lede.zip -d $WORKINGDIR
rm $WORKINGDIR/master.zip
rm $WORKINGDIR/lede.zip

WORKINGDIR="package/mosdnssou"
mkdir $WORKINGDIR -p
wget https://github.com/QiuSimons/openwrt-mos/archive/8b4e917765825e7fd3f68865a2466edb70afaa6c.zip -O $WORKINGDIR/master.zip
unzip $WORKINGDIR/master.zip -d $WORKINGDIR
rm $WORKINGDIR/master.zip
