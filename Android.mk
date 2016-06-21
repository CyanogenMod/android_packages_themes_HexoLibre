#
# Copyright (C) 2008 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

#Define standard theme assets
LOCAL_ASSET_DIR := $(LOCAL_PATH)/assets/

#Define bacon appfilter overlay to disable gapps
ifeq ($(TARGET_PRODUCT),cm_bacon)
    LOCAL_ASSET_DIR := $(LOCAL_PATH)/device/bacon/assets $(LOCAL_PATH)/assets
endif

LOCAL_MODULE_TAGS := optional

LOCAL_PACKAGE_NAME := Hexo
LOCAL_JAVA_LIBRARIES := framework-base

# Sign the package when not using test-keys
ifneq ($(DEFAULT_SYSTEM_DEV_CERTIFICATE),build/target/product/security/testkey)
LOCAL_CERTIFICATE := cyngn-app
endif

include $(BUILD_PACKAGE)
