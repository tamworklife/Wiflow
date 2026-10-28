include $(TOPDIR)/rules.mk

LUCI_TITLE:=WiFlow LuCI visual style
LUCI_DESCRIPTION:=Responsive WiFlow styling layered over the existing LuCI theme without replacing backend handlers
LUCI_DEPENDS:=+luci-base
LUCI_PKGARCH:=all
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/wiflow-luci-style
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=$(LUCI_TITLE)
  DEPENDS:=$(LUCI_DEPENDS)
  PKGARCH:=all
endef

define Package/wiflow-luci-style/description
 WiFlow responsive styling for the existing LuCI pages. No wireless backend or RPC handlers are replaced.
endef

define Package/wiflow-luci-style/install
	$(INSTALL_DIR) $(1)/www/luci-static/resources
	$(INSTALL_DATA) ./htdocs/wiflow.css $(1)/www/luci-static/resources/wiflow.css
	$(INSTALL_DATA) $(CURDIR)/../../assets/favicon-512.png $(1)/www/luci-static/resources/wiflow-favicon.png
	$(INSTALL_DIR) $(1)/usr/share/wiflow
	$(INSTALL_DATA) $(CURDIR)/../../assets/favicon-512.png $(1)/usr/share/wiflow/favicon.png
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./root/etc/uci-defaults/99-wiflow-style $(1)/etc/uci-defaults/99-wiflow-style
endef

$(eval $(call BuildPackage,wiflow-luci-style))
