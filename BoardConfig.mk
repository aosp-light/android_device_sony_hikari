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

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9

# Extended flag
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DLEGACY_BLOB_COMPATIBLE

# Kernel
#TARGET_KERNEL_CONFIG := aosp_hazard_defconfig
#TARGET_KERNEL_SOURCE := kernel/somc/msm8x60
BOARD_KERNEL_BASE     := 0x40208000
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x04150000 --base 0x40208000
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := # Hazard no support it

# Board
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOOTLOADER_BOARD_NAME := fuji
TARGET_VENDOR_PLATFORM := fuji
TARGET_BOOTLOADER_NAME=hazard
TARGET_BOARD_INFO_FILE := device/somc/hazard/board-info.txt
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_HAS_NO_MISC_PARTITION := true

# Partition
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1056964608
BOARD_FLASH_BLOCK_SIZE := 131072

# BT
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/somc/hazard/bluetooth/vnd_hazard.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/somc/hazard/bluetooth

# FM
#BOARD_HAVE_FMRADIO := true
#BOARD_HAVE_FMRADIO_BCM := true

# Sensor
BOARD_USES_GENERIC_INVENSENSE := false
SOMC_CFG_SENSORS_ACCEL_BMA250NA_INPUT := yes
SOMC_CFG_SENSORS_COMPASS_AK8972 := yes
SOMC_CFG_SENSORS_LIGHT_LIBALS := yes
SOMC_CFG_SENSORS_PROXIMITY_APDS9702 := yes
SOMC_CFG_SENSORS_GYRO_MPU3050 := yes
SOMC_CFG_SENSORS_HAVE_LIBAK8972 := yes
SOMC_CFG_SENSORS_HAVE_LIBALS := yes
SOMC_CFG_SENSORS_HAVE_LIBMPU3050 := yes

# Wifi related defines
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"

# Display
BOARD_EGL_CFG := device/somc/hazard/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITON := true

# Camera
BOARD_USES_CAMERA_FAST_AUTOFOCUS := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Audio
BOARD_USES_ALSA_AUDIO := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB = device/somc/hazard/recovery.fstab
TARGET_NO_SEPARATE_RECOVERY := true
BOARD_HAS_NO_REAL_SDCARD := true
TARGET_RECOVERY_PRE_COMMAND := "touch /cache/recovery/boot;sync;"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_USB_STORAGE := true
BOARD_SDCARD_INTERNAL_DEVICE := /dev/block/mmcblk0p15
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_FSTAB_VERSION := 2
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Custom boot.img tool
BOARD_CUSTOM_BOOTIMG_MK := device/somc/hazard/custombootimg.mk

HAVE_ADRENO_SOURCE:= false

-include vendor/somc/hazard/BoardConfigVendor.mk
