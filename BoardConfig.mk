#
# Copyright (C) 2014-2015, BPaul
#

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DLEGACY_BLOB_COMPATIBLE

USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITON := true
BOARD_EGL_CFG := device/sony/hikari/rootdir/system/lib/egl/egl.cfg

# Audio
BOARD_USES_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/sony/hikari/bluetooth/vnd_hikari.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/hikari/bluetooth

TARGET_USES_ION := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Wi-Fi definitions for Broadcom solution
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/vendor/firmware/fw_bcmdhd.bin

# BT definitions for Broadcom solution
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/hikari/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# DASH
BOARD_USES_GENERIC_INVENSENSE := false
SOMC_CFG_SENSORS_COMPASS_AK8972 := yes
SOMC_CFG_SENSORS_HAVE_LIBAK8972 := yes
SOMC_CFG_SENSORS_LIGHT_LIBALS := yes
SOMC_CFG_SENSORS_HAVE_LIBALS := yes
SOMC_CFG_SENSORS_HAVE_LIBMPU3050 := yes
SOMC_CFG_SENSORS_GYRO_MPU3050 := yes
SOMC_CFG_SENSORS_ACCEL_BMA250NA_INPUT := yes
SOMC_CFG_SENSORS_COMPASS_AK8972 := yes
SOMC_CFG_SENSORS_PROXIMITY_APDS9702 := yes

# Board
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOOTLOADER_BOARD_NAME := fuji

# OTA
TARGET_RELEASETOOLS_EXTENSIONS := device/sony/hikari
TARGET_OTA_ASSERT_DEVICE := LT26,LT26w,SO-03D,hikari

# Enable dual-recovery custom ota script
SONY_USE_CUSTOM_MKBOOTIMG := true
SONY_USE_CUSTOM_BOOT := true

ifeq ($(SONY_USE_CUSTOM_BOOT),true)
ifeq ($(SONY_USE_CUSTOM_MKBOOTIMG),true)
BOARD_CUSTOM_BOOTIMG_MK := device/sony/hikari/customboot.mk
else
BOARD_CUSTOM_BOOTIMG_MK := device/sony/hikari/stockboot.mk
endif
else
BOARD_CUSTOM_MKBOOTIMG := device/sony/hikari/tools/mkbootimg.py
BOARD_MKBOOTIMG_ARGS := \
	out/target/product/hikari/kernel@0x40208000 \
	out/target/product/hikari/ramdisk.img@0x41500000,ramdisk \
	device/sony/hikari/prebuilt/RPM.bin@0x20000,rpm
endif

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
