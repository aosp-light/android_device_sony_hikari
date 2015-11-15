LOCAL_PATH := $(call my-dir)

MKELF := $(LOCAL_PATH)/tools/mkelf.py

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(PRODUCT_OUT)/kernel $(INSTALLED_RAMDISK_TARGET) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	@echo ----- Making boot image ------
	$(hide) python $(MKELF) -o $@ $(PRODUCT_OUT)/kernel@0x40208000 $(PRODUCT_OUT)/ramdisk.img@0x41500000,ramdisk device/sony/hikari/prebuilt/RPM.bin@0x20000,rpm
	@echo ----- Made boot image -------- $@

	$(hide) ln -f $(INSTALLED_BOOTIMAGE_TARGET) $(PRODUCT_OUT)/boot.elf

INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) $(recovery_kernel)
	@echo ----- Making recovery image ------
	$(hide) python $(MKELF) -o $@ $(PRODUCT_OUT)/kernel@0x40208000 $(PRODUCT_OUT)/ramdisk-recovery.img@0x41500000,ramdisk device/sony/hikari/prebuilt/RPM.bin@0x20000,rpm
	@echo ----- Made recovery image -------- $@

	$(hide) ln -f $(INSTALLED_RECOVERYIMAGE_TARGET) $(PRODUCT_OUT)/recovery.elf

