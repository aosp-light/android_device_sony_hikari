#
# Copyright 2014-2015, BPaul
#

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers

# Get the long list of APNs
PRODUCT_COPY_FILES += device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_hikari
PRODUCT_DEVICE := hikari
PRODUCT_BRAND := Sony
PRODUCT_MODEL := LT26w
PRODUCT_MANUFACTURER := Sony
PRODUCT_RESTRICT_VENDOR_FILES := false

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/sony/hikari/device.mk)
$(call inherit-product-if-exists, vendor/sony/hikari/device-vendor.mk)
