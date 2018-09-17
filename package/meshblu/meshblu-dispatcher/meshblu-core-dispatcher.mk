################################################################################
#
# meshblu-core-dispatcher
#
################################################################################

MESHBLU_DISPATCHER_VERSION = knot
MESHBLU_DISPATCHER_SITE_METHOD = git
MESHBLU_DISPATCHER_SITE = https://github.com/ramonhpr/meshblu-core-dispatcher.git
MESHBLU_DISPATCHER_DEPENDENCIES = nodejs mongodb redis

define MESHBLU_DISPATCHER_BUILD_CMDS
	rm -rf $(TARGET_DIR)/usr/local/bin/meshblu/meshblu-dispatcher
	mkdir -p $(TARGET_DIR)/usr/local/bin/meshblu/meshblu-dispatcher
	cd $(@D) && $(NPM) install --production && `$(NPM) bin`/coffee --compile `find -name "*.coffee"`
endef

define MESHBLU_DISPATCHER_INSTALL_TARGET_CMDS
	cp -R $(@D)/. $(TARGET_DIR)/usr/local/bin/meshblu/meshblu-dispatcher
	$(INSTALL) -D -m 0755 $(MESHBLU_DISPATCHER_PKGDIR)/meshblu-dispatcher $(TARGET_DIR)/usr/local/bin/
endef

define MESHBLU_DISPATCHER_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(MESHBLU_DISPATCHER_PKGDIR)/S60meshblu-dispatcher $(TARGET_DIR)/etc/init.d/
endef
$(eval $(generic-package))
