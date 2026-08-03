#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 The TWRP Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := $(TARGET_CPU_VARIANT)
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := $(PRODUCT_PLATFORM)
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := $(TARGET_BOOTLOADER_BOARD_NAME)
QCOM_BOARD_PLATFORMS += $(TARGET_BOARD_PLATFORM)

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk

TARGET_KERNEL_ARCH := $(TARGET_ARCH)
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

BOARD_KERNEL_CMDLINE := \
    console=null \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    lpm_levels.sleep_disabled=1 \
    video=vfb:640x400,bpp=32,memsize=3072000 \
    msm_rtb.filter=0x237 \
    service_locator.enable=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    swiotlb=2048 \
    printk.devkmsg=on \
    firmware_class.path=/vendor/firmware_mnt/image \
    loop.max_part=7 \
    msm_ss.restart_level=1 \
    panic=0

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS := \
    --dtb $(DEVICE_PATH)/prebuilt/dtb \
    --kernel_offset 0x00008000 \
    --ramdisk_offset 0x02000000 \
    --tags_offset 0x01e00000 \
    --dtb_offset 0x01f00000 \
    --header_version 2
BOARD_ROOT_EXTRA_FOLDERS := \
    carrier \
    efs \
    keydata \
    keyrefuge \
    metadata \
    misc \
    omr \
    optics \
    prism \
    spu

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 82694144
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 82694144

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Dynamic partitions
BOARD_SUPER_PARTITION_SIZE := 10292822016
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 10288627712
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system odm product vendor

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_ODM := odm
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Encryption
BOARD_USES_METADATA_PARTITION := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
RECOVERY_SDCARD_ON_DATA := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# TWRP specific build flags
TW_MAINTAINER := AstroByteX-Code
TW_DEVICE_VERSION := AstroForge_v1
TW_THEME := portrait_hdpi
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_SCREEN_BLANK=true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 25500
TW_DEFAULT_BRIGHTNESS := 12800
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone17/temp"
TW_Y_OFFSET := 100
TW_H_OFFSET := -100
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BACKUP_EXCLUSIONS := /data/fonts
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_USB_USE_FFS_MTP := true
TW_USB_USE_GADGET_HAL := false
TW_USB_CONFIGFS := true
TW_USB_CONTROLLER := "a600000.dwc3"
TW_USB_FFS_MTP_READY := 0

TW_EXCLUDE_TWRPAPP := true

TW_INCLUDE_CRYPTO := true
TW_ENABLE_FS_COMPRESSION := true
TW_INCLUDE_CRYPTO_FBE := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_CRYPTO_METADATA_OPTIONS := "::v2"
TW_CRYPTO_METADATA_DELETE_ALL_KEYS := false
TW_CRYPTO_DM_DEFAULT_KEY_VERSION := 2
TW_CRYPTO_VOLUME_METADATA_METHOD := "dm-default-key"
TW_KEYSTORE_TYPE := "sakv2,gak,sgak"
TW_KEYSTORE_HARDWARE := "mdfpp"
TW_GATEKEEPER_HARDWARE := "mdfpp"
TW_KEYSTORE_DESEDE := true
TW_INCLUDE_NTFS_3G := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LPTOOLS := true
TW_FRAMERATE := 120
TW_EXCLUDE_APEX := true
TW_INCLUDE_REPACKTOOLS := true
TARGET_RECOVERY_DEVICE_MODULES += android.hardware.vibrator@1.0 android.hardware.vibrator@1.1 android.hardware.vibrator@1.2 android.hardware.vibrator@1.3
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator@1.0.so $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator@1.1.so $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator@1.2.so $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator@1.3.so


# TWRP Configuration: Logd
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
