################################################################################
#
# meshblu-core-adapter-http
#
################################################################################

MESHBLU_ADAPTER_HTTP_VERSION = master
MESHBLU_ADAPTER_HTTP_SITE_METHOD = git
MESHBLU_ADAPTER_HTTP_SITE = https://github.com/octoblu/meshblu-core-protocol-adapter-http.git
MESHBLU_ADAPTER_HTTP_DEPENDENCIES = nodejs meshblu-dispatcher

define MESHBLU_ADAPTER_HTTP_BUILD_CMDS
	rm -rf $(TARGET_DIR)/usr/local/bin/meshblu/meshblu-http
	mkdir -p $(TARGET_DIR)/usr/local/bin/meshblu/meshblu-http
	cd $(@D) && $(NPM) install --production
endef

define MESHBLU_ADAPTER_HTTP_INSTALL_TARGET_CMDS
	cp -R $(@D)/. $(TARGET_DIR)/usr/local/bin/meshblu/meshblu-http
	$(INSTALL) -D -m 0755 $(MESHBLU_ADAPTER_HTTP_PKGDIR)/meshblu-http $(TARGET_DIR)/usr/local/bin/
endef

define MESHBLU_ADAPTER_HTTP_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(MESHBLU_ADAPTER_HTTP_PKGDIR)/S60meshblu-adapter-http $(TARGET_DIR)/etc/init.d/
endef
$(eval $(generic-package))
