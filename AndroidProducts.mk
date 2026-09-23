#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 The TWRP Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_z3q.mk

COMMON_LUNCH_CHOICES := \
    twrp_z3q-eng

PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/omni_z3q.mk

COMMON_LUNCH_CHOICES += \
    omni_z3q-eng