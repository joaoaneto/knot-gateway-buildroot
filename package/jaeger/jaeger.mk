################################################################################
#
# jaeger
#
################################################################################

JAEGER_VERSION = v1.14.0
JAEGER_SITE = $(call github,jaegertracing,jaeger,$(JAEGER_VERSION))
JAEGER_LICENSE = Apache-2.0
JAEGER_LICENSE_FILES = LICENSE

$(eval $(golang-package))
