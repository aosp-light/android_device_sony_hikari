#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL hazard devices, and
# are also specific to hazard devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/somc/hazard/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Lights
PRODUCT_PACKAGES := \
    lights.msm8660

# Display
PRODUCT_PACKAGES += \
    libgenlock \
    liboverlay \
    hwcomposer.msm8660 \
    gralloc.msm8660 \
    memtrack.msm8660 \
    copybit.msm8660

# Media
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVenc \
    libOmxCore \
    libstagefrighthw \
    libc2dcolorconvert

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8660 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler

ifneq ($(findstring fuji, $(TARGET_PRODUCT)),)
LOCAL_KERNEL := device/somc/hazard/kernel/kernel-fuji
else
LOCAL_KERNEL := device/somc/hazard/kernel/kernel
endif

PRODUCT_COPY_FILES := \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += device/somc/hazard/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += device/somc/hazard/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += device/somc/hazard/thermald-hazard.conf:system/etc/thermald.conf

PRODUCT_COPY_FILES += \
    device/somc/hazard/init.semc.rc:root/init.semc.rc \
    device/somc/hazard/init.somc.rc:root/init.somc.rc \
    device/somc/hazard/init.somc.usb.rc:root/init.somc.usb.rc \
    device/somc/hazard/init.somc-platform.rc:root/init.somc-platform.rc \
    device/somc/hazard/fstab.semc:root/fstab.semc \
    device/somc/hazard/ueventd.semc.rc:root/ueventd.semc.rc \
    device/somc/hazard/prebuilt/logo.rle:root/logo.rle \
    device/somc/hazard/media_profiles.xml:system/etc/media_profiles.xml \
    device/somc/hazard/media_codecs.xml:system/etc/media_codecs.xml \
    device/somc/hazard/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    device/somc/hazard/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
    device/somc/hazard/init.qcom.sh:root/init.qcom.sh


# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
    device/somc/hazard/fuji-keypad.kl:system/usr/keylayout/fuji-keypad.kl \
    device/somc/hazard/gpio-key.kl:system/usr/keylayout/gpio-key.kl \
    device/somc/hazard/keypad-pmic-fuji.kl:system/usr/keylayout/keypad-pmic-fuji.kl \
    device/somc/hazard/pmic8058_pwrkey.kl:system/usr/keylayout/pmic8058_pwrkey.kl \
    device/somc/hazard/simple_remote.kl:system/usr/keylayout/simple_remote.kl \
    device/somc/hazard/simple_remote_appkey.kl:system/usr/keylayout/simple_remote_appkey.kl

# Prebuilt input device calibration files
PRODUCT_COPY_FILES += \
    device/somc/hazard/clearpad.idc:system/usr/idc/clearpad.idc \
    device/somc/hazard/clearpad.kl:system/usr/keylayout/clearpad.kl

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# NFC
PRODUCT_PACKAGES += \
    nfc.msm8660 \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/somc/hazard/nfc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/somc/hazard/nfc/nfcee_access_debug.xml
endif

# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    libbluedroid \
    brcm_patchram_plus \
    bt_vendor.conf

# Wifi
PRODUCT_PACKAGES += \
    libnetcmdiface

#WIFI_BAND := 802_11_BG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

PRODUCT_COPY_FILES += \
    device/somc/hazard/config/calibration:system/etc/wifi/calibration

# DASH
PRODUCT_COPY_FILES += \
    device/somc/hazard/config/sensors.conf:system/etc/sensors.conf

PRODUCT_PACKAGES += \
    sensors.msm8660 \
    libmlplatform \
    libmllite \
    libmpl

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# Audio Configuration
# FIXME: Remove persist.audio.handset.mic and persist.audio.fluence.mode
#        while switching new audio HAL from legacy HAL
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.handset.mic.type=digital \
    persist.audio.dualmic.config=endfire \
    persist.audio.fluence.voicecall=true \
    persist.audio.handset.mic=dmic \
    persist.audio.fluence.mode=endfire \
    persist.audio.lowlatency.rec=false \
    af.resampler.quality=4

PRODUCT_CHARACTERISTICS := default

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += com.android.future.usb.accessory

# Voice processing
PRODUCT_PACKAGES += libqcomvoiceprocessing

PRODUCT_COPY_FILES += \
    device/somc/hazard/audio_effects.conf:system/vendor/etc/audio_effects.conf

# Another blobs
PRODUCT_COPY_FILES += \
    device/somc/hazard/prebuilt/bootanimation.zip:system/media/bootanimation.zip \
    device/somc/hazard/config/clearpad_fwloader.sh:system/etc/clearpad_fwloader.sh \
    device/somc/hazard/config/flashled_calc_parameters.cfg:system/etc/flashled_calc_parameters.cfg \
    device/somc/hazard/config/hw_config.sh:system/etc/hw_config.sh \
    device/somc/hazard/config/iddd.conf:system/etc/iddd.conf \
    device/somc/hazard/config/init.netconfig.sh:system/etc/init.netconfig.sh \
    device/somc/hazard/config/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
    device/somc/hazard/config/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/somc/hazard/config/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/somc/hazard/config/pre_hw_config.sh:system/etc/pre_hw_config.sh \
    device/somc/hazard/config/qosmgr_rules.xml:system/etc/qosmgr_rules.xml

PRODUCT_PACKAGES += \
    libemoji \
    e2fsck \
    fsck_msdos \
    Email \
    Stk

PRODUCT_PACKAGES += \
    busybox

# Recovery
PRODUCT_PACKAGES += \
    extract_elf_ramdisk

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
    $(LOCAL_PATH)/recovery/rebootrecovery.sh:recovery/root/sbin/rebootrecovery.sh \
    $(LOCAL_PATH)/recovery/bootrec-device:recovery/bootrec-device

# GPS configuration
PRODUCT_COPY_FILES += \
    device/somc/hazard/gps.conf:system/etc/gps.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
