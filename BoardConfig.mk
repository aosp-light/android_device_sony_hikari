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

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := # Hazard no support it

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOOTLOADER_BOARD_NAME := FUJI
TARGET_BOOTLOADER_NAME=hazard
TARGET_BOARD_INFO_FILE := device/somc/hazard/board-info.txt

# BT
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/somc/hazard/bluetooth/vnd_hazard.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/somc/hazard/bluetooth

# Wifi
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P		 := "/system/vendor/firmware/fw_bcmdhd.bin"

# Display
BOARD_EGL_CFG := device/somc/hazard/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true
TARGET_USES_C2D_COMPOSITON := true

TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

TARGET_RECOVERY_FSTAB = device/somc/hazard/fstab.semc

BOARD_HAL_STATIC_LIBRARIES := libdumpstate.hazard

TARGET_RELEASETOOLS_EXTENSIONS := device/somc/hazard

# RIL
BOARD_RIL_CLASS := ../../../device/somc/hikari/ril/

BOARD_SEPOLICY_DIRS := \
    device/somc/hazard/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    property_contexts \
    te_macros \
    bluetooth_loader.te \
    bridge.te \
    camera.te \
    device.te \
    dhcp.te \
    domain.te \
    drmserver.te \
    file.te \
    kickstart.te \
    init.te \
    mac_update.te \
    mediaserver.te \
    mpdecision.te \
    netmgrd.te \
    qmux.te \
    rild.te \
    rmt.te \
    surfaceflinger.te \
    system.te \
    tee.te \
    thermald.te \
    ueventd.te \
    vold.te \
    wpa_supplicant.te

HAVE_ADRENO_SOURCE:= false

# Disable adb RSA security and enable adb root when debug
ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
ADDITIONAL_DEFAULT_PROPERTIES := ro.adb.secure=0	\
	ro.secure=0
endif

-include vendor/somc/hazard/BoardConfigVendor.mk
