PRODUCT_VERSION_MAJOR = 14
PRODUCT_VERSION_MINOR = 0

# Increase EVEREST Version with each major release.
EVEREST_VERSION := 1.5
EVEREST_BUILD_TYPE ?= UNOFFICIAL

ifeq ($(WITH_GAPPS),true)
EVEREST_EDITION := GAPPS
else
EVEREST_EDITION := VANILLA
endif

# Set all versions
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)

# Internal version
LINEAGE_VERSION := EverestOS-V$(EVEREST_VERSION)-$(LINEAGE_BUILD)-$(EVEREST_BUILD_TYPE)-$(EVEREST_EDITION)-$(BUILD_TIME)-$(BUILD_DATE)

# Display version
LINEAGE_DISPLAY_VERSION := EverestOS-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_BUILD)-v$(EVEREST_VERSION)

# Signing
ifneq (eng,$(TARGET_BUILD_VARIANT))
ifneq (,$(wildcard vendor/everest/signing/keys/releasekey.pk8))
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/everest/signing/keys/releasekey
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.oem_unlock_supported=1
endif
ifneq (,$(wildcard vendor/everest/signing/keys/otakey.x509.pem))
PRODUCT_OTA_PUBLIC_KEYS := vendor/everest/signing/keys/otakey.x509.pem
endif
endif
