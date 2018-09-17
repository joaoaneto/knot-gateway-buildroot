################################################################################
#
# meshblu-core-worker-webhook
#
################################################################################

MESHBLU_WORKER_WEBHOOK_VERSION = master
MESHBLU_WORKER_WEBHOOK_SITE_METHOD = git
MESHBLU_WORKER_WEBHOOK_SITE = https://github.com/octoblu/meshblu-core-worker-webhook.git
MESHBLU_WORKER_WEBHOOK_DEPENDENCIES = nodejs

define MESHBLU_WORKER_WEBHOOK_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/local/bin/meshblu
	mkdir -p $(TARGET_DIR)/usr/local/bin/meshblu/meshblu-worker-webhook
	cd $(@D) && $(NPM) install --production
	cp -R $(@D)/. $(TARGET_DIR)/usr/local/bin/meshblu/meshblu-worker-webhook
endef

define MESHBLU_WORKER_WEBHOOK_INSTALL_INIT_SCRIPT
#	$(INSTALL) -D -m 0755 $(MESHBLU_WORKER_WEBHOOK_PKGDIR)/S60meshblu $(TARGET_DIR)/etc/init.d/
#	$(INSTALL) -D -m 0755 $(MESHBLU_WORKER_WEBHOOK_PKGDIR)/meshblu $(TARGET_DIR)/usr/local/bin/
endef

MESHBLU_WORKER_WEBHOOK_POST_INSTALL_TARGET_HOOKS += MESHBLU_WORKER_WEBHOOK_INSTALL_INIT_SCRIPT

$(eval $(generic-package))
