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

$(call inherit-product, device/sony/hikari/device.mk)
$(call inherit-product-if-exists, vendor/somc/hazard/hazard-vendor.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_COPY_FILES += \
     device/sony/hikari/rootdir/logo.rle:root/logo.rle \
     device/sony/hikari/rootdir/system/etc/firmware/BCM4330.hcd:system/etc/firmware/BCM4330.hcd \
     device/sony/hikari/rootdir/system/etc/sensors.conf:system/etc/sensors.conf \
     device/sony/hikari/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml \
     device/sony/hikari/rootdir/system/etc/thermald.conf:system/etc/thermald.conf

PRODUCT_NAME := aosp_hikari
PRODUCT_DEVICE := hikari
PRODUCT_BRAND := Sony
PRODUCT_MODEL := LT26w
PRODUCT_LOCALES += xhdpi hdpi
PRODUCT_MANUFACTURER := Sony

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

PRODUCT_COPY_FILES += \
     device/sony/hikari/config/calibration:system/etc/wifi/calibration \
     device/sony/hikari/config/calibration2g:system/etc/wifi/calibration2g
