#
# Copyright 2014-2015, BPaul
#

TARGET_PREBUILT_KERNEL := device/sony/hikari-kernel/zImage
PRODUCT_COPY_FILES += $(TARGET_PREBUILT_KERNEL):kernel

# Copy all others kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell test -d device/sony/hikari-kernel/modules && \
	find device/sony/hikari-kernel/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')

# Kernel
PRODUCT_PACKAGES += \
    kernel

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/sony/hikari/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Light
PRODUCT_PACKAGES += \
    lights.semc

# Display
PRODUCT_PACKAGES += \
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

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/config/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/config/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/mixer_paths.xml:system/etc/mixer_paths.xml

# NFC
PRODUCT_PACKAGES += \
    nfc.msm8660 \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/nfcee_access.xml:system/etc/nfcee_access.xml

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    libbluedroid \
    brcm_patchram_plus \
    bt_vendor.conf

# Wifi
PRODUCT_PACKAGES += \
    libnetcmdiface \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/calibration:system/etc/wifi/calibration

$(call inherit-product-if-exists, device/sony/fuji/firmware/semc-bcm.mk)

# DASH
PRODUCT_PACKAGES += \
    sensors.msm8660 \
    libmlplatform \
    libmllite \
    libmpl

PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/sensors.conf:system/etc/sensors.conf

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# Configuration scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/flashled_calc_parameters.cfg:system/etc/flashled_calc_parameters.cfg \
    $(LOCAL_PATH)/config/iddd.conf:system/etc/iddd.conf \
    $(LOCAL_PATH)/config/qosmgr_rules.xml:system/etc/qosmgr_rules.xml \
    $(LOCAL_PATH)/config/thermald.conf:system/etc/thermald.conf

# Common Qualcomm / Sony scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/logo.rle:root/logo.rle \
    $(LOCAL_PATH)/config/init.sony.usb.rc:root/init.sony.usb.rc \
    $(LOCAL_PATH)/config/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/config/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    $(LOCAL_PATH)/config/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
    $(LOCAL_PATH)/config/init.netconfig.sh:system/etc/init.netconfig.sh \
    $(LOCAL_PATH)/config/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
    $(LOCAL_PATH)/config/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    $(LOCAL_PATH)/config/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/config/pre_hw_config.sh:system/etc/pre_hw_config.sh \
    $(LOCAL_PATH)/config/hw_config.sh:system/etc/hw_config.sh \
    $(LOCAL_PATH)/config/clearpad_fwloader.sh:system/etc/clearpad_fwloader.sh

# Custom init / uevent
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/init.semc.rc:root/init.semc.rc \
    $(LOCAL_PATH)/config/init.sony.rc:root/init.sony.rc \
    $(LOCAL_PATH)/config/ueventd.semc.rc:root/ueventd.semc.rc \
    $(LOCAL_PATH)/config/fstab.semc:root/fstab.semc \
    $(LOCAL_PATH)/config/init.sony-platform.rc:root/init.sony-platform.rc

# BT
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
    $(LOCAL_PATH)/config/BCM4330.hcd:system/etc/firmware/BCM4330.hcd

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Fm radio
PRODUCT_PACKAGES += \
    com.stericsson.hardware.fm \
    com.stericsson.hardware.fm.xml \
    FmRadio

# Key layouts and touchscreen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/clearpad.idc:system/usr/idc/clearpad.idc \
    $(LOCAL_PATH)/config/clearpad.kl:system/usr/keylayout/clearpad.kl \
    $(LOCAL_PATH)/config/fuji-keypad.kl:system/usr/keylayout/fuji-keypad.kl \
    $(LOCAL_PATH)/config/gpio-key.kl:system/usr/keylayout/gpio-key.kl \
    $(LOCAL_PATH)/config/keypad-pmic-fuji.kl:system/usr/keylayout/keypad-pmic-fuji.kl \
    $(LOCAL_PATH)/config/pmic8058_pwrkey.kl:system/usr/keylayout/pmic8058_pwrkey.kl \
    $(LOCAL_PATH)/config/simple_remote.kl:system/usr/keylayout/simple_remote.kl \
    $(LOCAL_PATH)/config/simple_remote_appkey.kl:system/usr/keylayout/simple_remote_appkey.kl \
    $(LOCAL_PATH)/config/Vendor_0583_Product_A000.kl:system/usr/keylayout/Vendor_0583_Product_A000.kl

# Ramdisk recovery support
PRODUCT_COPY_FILES += \
    device/sony/hikari/recovery/bootrec-device:recovery/root/etc/bootrec-device \
    device/sony/hikari/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
    device/sony/hikari/recovery/rebootrecovery.sh:recovery/root/sbin/rebootrecovery.sh

# Software
PRODUCT_PACKAGES += \
    libemoji \
    e2fsck \
    fsck_msdos \
    Email \
    Stk

PRODUCT_PACKAGES += \
    busybox \
    extract_elf_ramdisk

PRODUCT_PACKAGES += \
    FujiLayout \
    fileman

PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
