#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
PRODUCT_COPY_FILES += $(TARGET_PREBUILT_KERNEL):kernel

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

$(call inherit-product, device/somc/hazard/device.mk)
$(call inherit-product-if-exists, vendor/somc/hazard/hazard-vendor.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_COPY_FILES += \
     device/somc/hazard/rootdir/logo.rle:root/logo.rle \
     device/somc/hazard/rootdir/system/etc/firmware/BCM4330.hcd:system/etc/firmware/BCM4330.hcd \
     device/somc/hazard/rootdir/system/etc/sensors.conf:system/etc/sensors.conf \
     device/somc/hazard/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml \
     device/somc/hazard/rootdir/system/etc/thermald.conf:system/etc/thermald.conf

PRODUCT_NAME := aosp_hazard
PRODUCT_DEVICE := hazard
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Xperia acro S
PRODUCT_LOCALES += xhdpi hdpi
PRODUCT_MANUFACTURER := Sony

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

PRODUCT_COPY_FILES += \
     device/somc/hazard/config/calibration:system/etc/wifi/calibration \
     device/somc/hazard/config/calibration2g:system/etc/wifi/calibration2g

PRODUCT_PROPERTY_OVERRIDES += \
     ro.sf.lcd_density=320
