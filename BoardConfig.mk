#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 The TWRP Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Architecture
TARGET_ARCH             := arm64
TARGET_ARCH_VARIANT     := armv8-a
TARGET_CPU_ABI          := arm64-v8a
TARGET_CPU_ABI2         :=
TARGET_CPU_VARIANT      := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH         := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI      := armeabi-v7a
TARGET_2ND_CPU_ABI2     := armeabi
TARGET_2ND_CPU_VARIANT  := $(TARGET_CPU_VARIANT)
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := $(PRODUCT_PLATFORM)
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := $(TARGET_BOOTLOADER_BOARD_NAME)
QCOM_BOARD_PLATFORMS += $(TARGET_BOARD_PLATFORM)

# MKBOOTIMG flags
BOARD_KERNEL_BASE          := 0x00000000
BOARD_NAME                 := SRPUH27A003
BOARD_KERNEL_PAGESIZE      := 4096
BOARD_KERNEL_OFFSET        := 0x00008000
BOARD_RAMDISK_OFFSET       := 0x02000000
BOARD_SECOND_OFFSET        := 0x00000000
BOARD_TAGS_OFFSET          := 0x01e00000
BOARD_HEADER_VERSION       := 2
BOARD_RECOVERY_DTBO_SIZE   := 669482
BOARD_RECOVERY_DTBO_OFFSET := 60018688
BOARD_HEADER_SIZE          := 1660
BOARD_DTB_SIZE             := 466624
BOARD_DTB_OFFSET           := 0x01f00000

BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_IMAGE_NAME     := kernel.gz
BOARD_PREBUILT_DTBOIMAGE    := $(DEVICE_PATH)/prebuilt/dtbo.img
TARGET_KERNEL_ARCH          := $(TARGET_ARCH)
TARGET_PREBUILT_DTB         := $(DEVICE_PATH)/prebuilt/dtb.img
TARGET_PREBUILT_KERNEL      := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)

BOARD_KERNEL_CMDLINE := \
    console=null \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    lpm_levels.sleep_disabled=1 \
    video=vfb:640x400,bpp=32,memsize=3072000 \
    msm_rtb.filter=0x237 \
    service_locator.enable=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    swiotlb=0 \
    loop.max_part=7 \
    cgroup.memory=nokmem,nosocket \
    firmware_class.path=/vendor/firmware_mnt/image \
    pcie_ports=compat \
    loop.max_part=7 \
    iptable_raw.raw_before_defrag=1 \
    ip6table_raw.raw_before_defrag=1 \
    printk.devkmsg=on

BOARD_MKBOOTIMG_ARGS := \
    --board $(BOARD_NAME) \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_TAGS_OFFSET) \
    --header_version $(BOARD_HEADER_VERSION) \
    --dtb_offset $(BOARD_DTB_OFFSET) \
    --dtb $(TARGET_PREBUILT_DTB)

BOARD_ROOT_EXTRA_FOLDERS := \
    carrier \
    efs \
    omr \
    optics \
    prism \
    spu

BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk

# Android Verified Boot
BOARD_AVB_ENABLE := false

# Samsung TS drivers (a73xq)
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
TW_LOAD_VENDOR_MODULES := "sec_cmd.ko sec_common_fn.ko sec_secure_touch.ko sec_tclm_v2.ko sec_tsp_dumpkey.ko sec_tsp_log.ko synaptics_ts.ko"

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 100663296
BOARD_DTBOIMG_PARTITION_SIZE       := 25165824
BOARD_FLASH_BLOCK_SIZE             := 131072          #(BOARD_KERNEL_PAGESIZE * 64)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 81788928
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Dynamic partitions
BOARD_SUPER_PARTITION_SIZE          := 12113149952 
BOARD_SUPER_PARTITION_GROUPS        := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE   := 12108955648          #(BOARD_SUPER_PARTITION_SIZE - 4194304)
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system odm product vendor

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE     := f2fs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE  := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE  := f2fs
TARGET_COPY_OUT_ODM     := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR  := vendor

# Encryption
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# TWRP specific build flags
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_BACKUP_EXCLUSIONS := /data/fonts
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone50/temp"
TW_DEFAULT_BRIGHTNESS := 128
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_HAS_DOWNLOAD_MODE := true
TW_H_OFFSET := -89
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_RESETPROP := true
TW_MAX_BRIGHTNESS := 486
TW_NO_REBOOT_BOOTLOADER := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_THEME := portrait_hdpi
TW_Y_OFFSET := 89