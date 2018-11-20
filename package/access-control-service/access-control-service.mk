################################################################################
#
#access-control-service
#
################################################################################

ACCESS_CONTROL_SERVICE_VERSION = dfefa7fa824bcb1f317302b0722c93318103a144
ACCESS_CONTROL_SERVICE_SITE_METHOD = git
ACCESS_CONTROL_SERVICE_SITE = https://github.com/joaoaneto/access-control-service.git
ACCESS_CONTROL_SERVICE_DEPENDENCIES = nodejs

define ACCESS_CONTROL_SERVICE_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/local/bin/access-control-service
	mkdir -p $(TARGET_DIR)/usr/local/bin/access-control-service
	cd $(@D) && $(NPM) install && $(NPM) run build
	cp -R $(@D)/. $(TARGET_DIR)/usr/local/bin/access-control-service
endef

define ACCESS_CONTROL_SERVICE_INSTALL_INIT_SCRIPT
	$(INSTALL) -D -m 0755 $(ACCESS_CONTROL_SERVICE_PKGDIR)/access-control $(TARGET_DIR)/usr/local/bin/
	$(INSTALL) -D -m 0755 $(ACCESS_CONTROL_SERVICE_PKGDIR)/S105access-control-service-daemon $(TARGET_DIR)/etc/init.d/
endef

ACCESS_CONTROL_SERVICE_POST_INSTALL_TARGET_HOOKS += ACCESS_CONTROL_SERVICE_INSTALL_INIT_SCRIPT

$(eval $(generic-package))
