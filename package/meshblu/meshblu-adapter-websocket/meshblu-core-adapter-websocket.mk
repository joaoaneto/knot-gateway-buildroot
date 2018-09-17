################################################################################
#
# meshblu-core-adapter-websocket
#
################################################################################

MESHBLU_ADAPTER_WEBSOCKET_VERSION = master
MESHBLU_ADAPTER_WEBSOCKET_SITE_METHOD = git
MESHBLU_ADAPTER_WEBSOCKET_SITE = https://github.com/octoblu/meshblu-core-protocol-adapter-websocket.git
MESHBLU_ADAPTER_WEBSOCKET_DEPENDENCIES = nodejs meshblu-dispatcher

define MESHBLU_ADAPTER_WEBSOCKET_BUILD_CMDS
	rm -rf $(TARGET_DIR)/usr/local/bin/meshblu/meshblu-websocket
	mkdir -p $(TARGET_DIR)/usr/local/bin/meshblu/meshblu-websocket
	cd $(@D) && $(NPM) install --production
endef

define MESHBLU_ADAPTER_WEBSOCKET_INSTALL_TARGET_CMDS
	cp -R $(@D)/. $(TARGET_DIR)/usr/local/bin/meshblu/meshblu-websocket
	$(INSTALL) -D -m 0755 $(MESHBLU_ADAPTER_WEBSOCKET_PKGDIR)/meshblu-websocket $(TARGET_DIR)/usr/local/bin/
endef

define MESHBLU_ADAPTER_WEBSOCKET_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(MESHBLU_ADAPTER_WEBSOCKET_PKGDIR)/S60meshblu-adapter-websocket $(TARGET_DIR)/etc/init.d/
endef
$(eval $(generic-package))
