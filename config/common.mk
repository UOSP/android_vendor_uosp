ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Override product info for Google Play Services and SafetyNet
ifeq ($(PRODUCT_OVERRIDE_INFO),true)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.product.system.name=$(PRODUCT_OVERRIDE_NAME) \
    ro.product.product.name=$(PRODUCT_OVERRIDE_NAME) \
    ro.product.system_ext.name=$(PRODUCT_OVERRIDE_NAME) \
    ro.product.odm.name=$(PRODUCT_OVERRIDE_NAME) \
    ro.product.vendor.name=$(PRODUCT_OVERRIDE_NAME) \
    ro.build.flavor=$(PRODUCT_OVERRIDE_NAME)-user \
    ro.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \
    ro.system.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \
    ro.product.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \
    ro.system_ext.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \
    ro.bootimage.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \
    ro.odm.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \
    ro.vendor.build.fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT)

# Description needs special treatment because it contains spaces
PRIVATE_BUILD_DESC := $(PRODUCT_OVERRIDE_DESC)
endif

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/uosp/prebuilt/common/lib/content-types.properties:$(TARGET_COPY_OUT_SYSTEM)/lib/content-types.properties


# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/Vendor_045e_Product_0719.kl

# Enforce privapp-permissions whitelist
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=enforce

# Include AOSP audio files
include vendor/uosp/config/aosp_audio.mk

# Inherit from bootanimation config
$(call inherit-product, vendor/uosp/config/bootanimation.mk)

# Inherit from our versioning
$(call inherit-product, vendor/uosp/config/versioning.mk)

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# AOSP packages
PRODUCT_PACKAGES += \
    Terminal

# Themes
PRODUCT_PACKAGES += \
    ThemePicker \
    UnknownThemesStub

# Extra tools in Lineage
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    nano \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# rsync
PRODUCT_PACKAGES += \
    rsync

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Additional apps
PRODUCT_PACKAGES += \
    ExactCalculator \
    Jelly

# Include uosp LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/uosp/overlay/dictionaries

# Flatten APEXs for performance
OVERRIDE_TARGET_FLATTEN_APEX := true

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/uosp/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/uosp/overlay/common

# Navbar
PRODUCT_PACKAGES += \
    GesturalNavigationOverlayLong \
    GesturalNavigationOverlayMedium \
    GesturalNavigationOverlayHidden
