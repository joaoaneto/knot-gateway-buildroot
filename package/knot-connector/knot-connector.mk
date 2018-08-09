################################################################################
#
#knot-connector
#
################################################################################

KNOT_CONNECTOR_VERSION = master
KNOT_CONNECTOR_SITE_METHOD = git
KNOT_CONNECTOR_SITE = https://github.com/CESARBR/knot-fog-connector.git
KNOT_CONNECTOR_DEPENDENCIES = nodejs

define KNOT_CONNECTOR_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/local/bin/knot-connector*
	mkdir -p $(TARGET_DIR)/usr/local/bin/
	cd $(@D) && $(NPM) install && $(NPM) run build
	cp -R $(@D) $(TARGET_DIR)/usr/local/bin/
endef

define KNOT_CONNECTOR_INSTALL_INIT_SCRIPT
	$(INSTALL) -D -m 0755 $(KNOT_CONNECTOR_PKGDIR)/knot-connector $(TARGET_DIR)/usr/local/bin/
	$(INSTALL) -D -m 0755 $(KNOT_CONNECTOR_PKGDIR)/S80knot-connector-daemon $(TARGET_DIR)/etc/init.d/
endef

KNOT_CONNECTOR_POST_INSTALL_TARGET_HOOKS += KNOT_CONNECTOR_INSTALL_INIT_SCRIPT

$(eval $(generic-package))
