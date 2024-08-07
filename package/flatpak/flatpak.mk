################################################################################
# Flatpak for QuantamOS
################################################################################

FLATPAK_VERSION = 1.14.4
FLATPAK_SOURCE = https://github.com/flatpak/flatpak/releases/download/$(FLATPAK_VERSION)/flatpak-$(FLATPAK_VERSION).tar.xz
FLATPAK_SITE = https://github.com/flatpak/flatpak
FLATPAK_DEPENDENCIES = libxml2
FLATPAK_LICENSE = GPL-2.0+
FLATPAK_LICENSE_FILES = COPYING

define FLATPAK_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) ./configure \
        --host=$(TARGET_CONFIGURE_OPTS) \
        --prefix=$(TARGET_DIR)/usr
    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define FLATPAK_INSTALL_TARGET_CMDS
    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
endef

$(eval $(generic-package))
