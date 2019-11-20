################################################################################
#
# KNOT-BABELTOWER
#
################################################################################

KNOT_BABELTOWER_VERSION = master
KNOT_BABELTOWER_SITE = $(call github,cesarbr,knot-babeltower,$(KNOT_BABELTOWER_VERSION))
KNOT_BABELTOWER_LICENSE = Apache-2.0
KNOT_BABELTOWER_LICENSE_FILES = LICENSE

# KNOT_BABELTOWER_BUILD_TARGETS = cmd/users

define KNOT_BABELTOWER_INSTALL_INIT_SCRIPT
	$(INSTALL) -D -m 0755 $(KNOT_BABELTOWER_PKGDIR)/S100knot-babeltower $(TARGET_DIR)/etc/init.d/
endef

define KNOT_BABELTOWER_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/local/mainflux/bin
	# cp $(KNOT_BABELTOWER_PKGDIR)/mainflux.config $(TARGET_DIR)/usr/local/mainflux/
	$(INSTALL) -D -m 0755 $(@D)/bin/users $(TARGET_DIR)/usr/local/mainflux/bin/
endef

KNOT_BABELTOWER_POST_INSTALL_TARGET_HOOKS += KNOT_BABELTOWER_INSTALL_INIT_SCRIPT

$(eval $(golang-package))