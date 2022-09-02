#
# Copyright (C) 2017-2019 NueXini
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-natflow
PKG_VERSION:=2022.08.13
PKG_RELEASE:=1

LUCI_URL:=https://github.com/NueXini/NueXini_Packages
LUCI_MAINTAINER:=NueXini

LUCI_TITLE:=LuCI Support for natflow
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+natflow-boot +kmod-nft-fullcone

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature