#
# Copyright (C) 2014-2015, BPaul
#

DEVICE_PACKAGE_OVERLAYS += \
     device/sony/hikari/overlay

CRAPPY_ROOT = device/sony/hikari/rootdir

PRODUCT_COPY_FILES += \
     $(CRAPPY_ROOT)/init.semc.rc:root/init.semc.rc \
     $(CRAPPY_ROOT)/init.semc.usb.rc:root/init.semc.usb.rc \
     $(CRAPPY_ROOT)/fstab.semc:root/fstab.semc \
     $(CRAPPY_ROOT)/ueventd.semc.rc:root/ueventd.semc.rc \
     $(CRAPPY_ROOT)/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
     $(CRAPPY_ROOT)/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
     $(CRAPPY_ROOT)/init.qcom.sh:root/init.qcom.sh \
     $(CRAPPY_ROOT)/system/usr/idc/clearpad.idc:system/usr/idc/clearpad.idc \
     $(CRAPPY_ROOT)/system/usr/keylayout/clearpad.kl:system/usr/keylayout/clearpad.kl \
     $(CRAPPY_ROOT)/system/usr/keylayout/fuji-keypad.kl:system/usr/keylayout/fuji-keypad.kl \
     $(CRAPPY_ROOT)/system/usr/keylayout/gpio-key.kl:system/usr/keylayout/gpio-key.kl \
     $(CRAPPY_ROOT)/system/usr/keylayout/keypad-pmic-fuji.kl:system/usr/keylayout/keypad-pmic-fuji.kl \
     $(CRAPPY_ROOT)/system/usr/keylayout/pmic8058_pwrkey.kl:system/usr/keylayout/pmic8058_pwrkey.kl \
     $(CRAPPY_ROOT)/system/etc/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
     $(CRAPPY_ROOT)/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
     $(CRAPPY_ROOT)/system/etc/clearpad_fwloader.sh:system/etc/clearpad_fwloader.sh \
     $(CRAPPY_ROOT)/system/etc/flashled_calc_parameters.cfg:system/etc/flashled_calc_parameters.cfg \
     $(CRAPPY_ROOT)/system/etc/hw_config.sh:system/etc/hw_config.sh \
     $(CRAPPY_ROOT)/system/etc/iddd.conf:system/etc/iddd.conf \
     $(CRAPPY_ROOT)/system/etc/init.netconfig.sh:system/etc/init.netconfig.sh \
     $(CRAPPY_ROOT)/system/etc/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
     $(CRAPPY_ROOT)/system/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
     $(CRAPPY_ROOT)/system/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
     $(CRAPPY_ROOT)/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
     $(CRAPPY_ROOT)/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
     $(CRAPPY_ROOT)/system/etc/pre_hw_config.sh:system/etc/pre_hw_config.so \
     $(CRAPPY_ROOT)/system/etc/qosmgr_rules.xml:system/etc/qosmgr_rules.xml

PRODUCT_COPY_FILES += \
     frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
     frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
     frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_COPY_FILES += \
     frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
     frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
     frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
     frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
     frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
     frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
     frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
     frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
     frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
     frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
     frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
     frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
     frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
     frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
     frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
     frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
     frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
     frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
     frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# NFC
PRODUCT_COPY_FILES += \
     $(CRAPPY_ROOT)/system/etc/nfcee_access.xml:system/etc/nfcee_access.xml \
     frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
     frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# NFC packages
PRODUCT_PACKAGES += \
     com.android.nfc_extras \
     NfcNci \
     Tag

# Audio
PRODUCT_PACKAGES += \
     audio.a2dp.default \
     audio.primary.msm8660 \
     audio.r_submix.default \
     audio.usb.default \
     libaudio-resampler

# GFX
PRODUCT_PACKAGES += \
     hwcomposer.msm8660 \
     gralloc.msm8660 \
     memtrack.msm8660 \
     copybit.msm8660 \
     liboverlay \
     libgenlock \
     libqdutils \
     libmemalloc \
     libqdMetaData \
     libqservice \
     libexternal

# Lights
PRODUCT_PACKAGES += \
     lights.msm8660

# GPS
PRODUCT_PACKAGES += \
     libloc_api_v02 \
     libloc_adapter \
     libloc_eng \
     libgps.utils \
     gps.msm8660

# Media
PRODUCT_PACKAGES += \
     libdivxdrmdecrypt \
     libOmxVdec \
     libOmxVenc \
     libOmxCore \
     libstagefrighthw \
     libc2dcolorconvert

# WLAN
PRODUCT_PACKAGES += \
     p2p_supplicant.conf \
     gsm_domains.conf \
     hostapd \
     libwpa_client \
     wpa_supplicant \
     wpa_supplicant.conf

PRODUCT_PACKAGES += \
     sensors.msm8660

PRODUCT_PROPERTY_OVERRIDES += \
     ro.opengles.version=131072

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
     persist.audio.handset.mic.type=digital \
     persist.audio.dualmic.config=endfire \
     persist.audio.fluence.voicecall=true \
     persist.audio.handset.mic=dmic \
     persist.audio.fluence.mode=endfire \
     persist.audio.lowlatency.rec=false \
     af.resampler.quality=4

PRODUCT_CHARACTERISTICS := default

PRODUCT_PACKAGES += \
     libemoji \
     e2fsck \
     fsck_msdos \
     Email \
     Stk

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
     persist.sys.usb.config=mtp

# Charger
PRODUCT_PACKAGES += \
     charger \
     charger_res_images \

PRODUCT_PACKAGES += \
     librs_jni

PRODUCT_PACKAGES += \
     Dialer \
     Email \
     Exchange2 \
     InCallUI \
     Launcher3

# Filesystem management tools
PRODUCT_PACKAGES += \
     e2fsck

PRODUCT_TAGS += dalvik.gc.type-precise

# APN list
PRODUCT_COPY_FILES += device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

PRODUCT_PROPERTY_OVERRIDES += \
     keyguard.no_require_sim=true
