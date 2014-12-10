#
# Copyright 2014-2015, BPaul
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter hikari,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
