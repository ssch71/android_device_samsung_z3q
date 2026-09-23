#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 The OrangeFox Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_PLATFORM := kona

PRODUCT_RELEASE_NAME := $(lastword $(subst /, ,$(lastword $(subst _, ,$(firstword $(subst ., ,$(MAKEFILE_LIST)))))))
CUSTOM_VENDOR := $(lastword $(subst /, ,$(firstword $(subst _, ,$(firstword $(MAKEFILE_LIST))))))

$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# OrangeFox is TWRP-based: inherit vendor/twrp, not vendor/orangefox
$(call inherit-product, vendor/twrp/config/common.mk)

BOARD_VENDOR := $(or $(word 2,$(subst /, ,$(firstword $(MAKEFILE_LIST)))),$(value 2))

PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_NAME := $(CUSTOM_VENDOR)_$(PRODUCT_DEVICE)
PRODUCT_BRAND := $(BOARD_VENDOR)
PRODUCT_MODEL := $(shell echo $(PRODUCT_BRAND) | tr  '[:lower:]' '[:upper:]')_$(PRODUCT_DEVICE)
PRODUCT_MANUFACTURER := $(PRODUCT_BRAND)

DEVICE_PATH := device/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)

$(call inherit-product, device/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)/device.mk)