################################################################################
#
#access-control-proxy
#
################################################################################

ACCESS_CONTROL_PROXY_VERSION = ca16c638e2b229cdcffcd6882f21fccf58650dc6
ACCESS_CONTROL_PROXY_SITE_METHOD = git
ACCESS_CONTROL_PROXY_SITE = https://github.com/joaoaneto/access-control-proxy.git
ACCESS_CONTROL_PROXY_DEPENDENCIES = nodejs

define ACCESS_CONTROL_PROXY_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/local/bin/access-control-proxy
	mkdir -p $(TARGET_DIR)/usr/local/bin/access-control-proxy
	cd $(@D) && $(NPM) install && $(NPM) run build
	cp -R $(@D)/. $(TARGET_DIR)/usr/local/bin/access-control-proxy
endef

define ACCESS_CONTROL_PROXY_INSTALL_INIT_SCRIPT
	$(INSTALL) -D -m 0755 $(ACCESS_CONTROL_PROXY_PKGDIR)/ac-proxy $(TARGET_DIR)/usr/local/bin/
	$(INSTALL) -D -m 0755 $(ACCESS_CONTROL_PROXY_PKGDIR)/S80access-control-proxy-daemon $(TARGET_DIR)/etc/init.d/
endef

ACCESS_CONTROL_PROXY_POST_INSTALL_TARGET_HOOKS += ACCESS_CONTROL_PROXY_INSTALL_INIT_SCRIPT

$(eval $(generic-package))
