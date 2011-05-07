#
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/ascend/ascend-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/ascend/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/ascend/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    copybit.M860 \
    gps.M860 \
    libRS \
    hwprops \
    rzscontrol \
    libOmxCore \
    libmm-omxcore \
    libOmxVidEnc \
    Gallery

# Live Wallpapers
PRODUCT_PACKAGES += \
    librs_jni \
    LiveWallpapersPicker

# Live Wallpapers support
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# vold
PRODUCT_COPY_FILES += \
    device/huawei/ascend/files/etc/vold.fstab:system/etc/vold.fstab

# Compcache module
PRODUCT_COPY_FILES += \
    device/huawei/ascend/modules/ramzswap.ko:system/lib/modules/2.6.29-perf/kernel/drivers/staging/ramzswap/ramzswap.ko

# Board-specific init
PRODUCT_COPY_FILES += \
    device/huawei/ascend/files/initlogo.rle:root/initlogo.rle

# Dummy backing file for USB mounting
PRODUCT_COPY_FILES += \
    device/huawei/ascend/files/cdrom/autorun.iso:system/cdrom/autorun.iso

# DHCP config for wifi
PRODUCT_COPY_FILES += \
    device/huawei/ascend/files/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

PRODUCT_COPY_FILES += \
    device/huawei/ascend/ueventd.qcom.rc:root/ueventd.qcom.rc

# Keylayouts
PRODUCT_COPY_FILES += \
    device/huawei/ascend/keychars/surf_keypad.kcm.bin:system/usr/keychars/surf_keypad.kcm.bin \
    device/huawei/ascend/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=30 \
    ro.sf.lcd_density=160 \
    ro.com.android.dataroaming=false

# Default network type
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=4

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=65537

# Perfomance tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.heapsize=24m \
    persist.sys.use_dithering=1 \
    ro.compcache.default=18

# Don't put dexfiles in /cache on ascend
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1

# media configuration xml file
PRODUCT_COPY_FILES += \
    device/huawei/ascend/files/etc/media_profiles.xml:system/etc/media_profiles.xml

# wpa_supplicant configuration file
PRODUCT_COPY_FILES += \
    device/huawei/ascend/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Proprietary hardware related
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend/proprietary/akmd2:system/bin/akmd2 \
    vendor/huawei/ascend/proprietary/libcamera.so:obj/lib/libcamera.so \
    vendor/huawei/ascend/proprietary/libcamera.so:system/lib/libcamera.so \
    vendor/huawei/ascend/proprietary/libqcamera.so:system/lib/libqcamera.so \
    vendor/huawei/ascend/proprietary/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/huawei/ascend/proprietary/libmmipl.so:system/lib/libmmipl.so \
    vendor/huawei/ascend/proprietary/libmmprocess.so:system/lib/libmmprocess.so \
    vendor/huawei/ascend/proprietary/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# Sound and OMX
PRODUCT_COPY_FILES += \
    device/huawei/ascend/files/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/huawei/ascend/files/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    vendor/huawei/ascend/proprietary/libaudioeq.so:system/lib/libaudioeq.so \
    vendor/huawei/ascend/proprietary/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/huawei/ascend/proprietary/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/huawei/ascend/proprietary/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/huawei/ascend/proprietary/libOmxVidEnc.so:system/lib/libOmxVidEnc.so

# HW
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend/proprietary/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so \
    vendor/huawei/ascend/proprietary/lights.msm7k.so:system/lib/hw/lights.msm7k.so \
    vendor/huawei/ascend/proprietary/sensors.default.so:system/lib/hw/sensors.default.so

# GPS
PRODUCT_COPY_FILES += \
    device/huawei/ascend/files/etc/gps.conf:system/etc/gps.conf

# Proprietary RIL related
PRODUCT_COPY_FILES += \
    device/huawei/ascend/files/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/huawei/ascend/proprietary/libauth.so:system/lib/libauth.so \
    vendor/huawei/ascend/proprietary/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/huawei/ascend/proprietary/libril.so:system/lib/libril.so \
    vendor/huawei/ascend/proprietary/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/huawei/ascend/proprietary/libdsm.so:system/lib/libdsm.so \
    vendor/huawei/ascend/proprietary/libqueue.so:system/lib/libqueue.so \
    vendor/huawei/ascend/proprietary/libcm.so:system/lib/libcm.so \
    vendor/huawei/ascend/proprietary/libdiag.so:system/lib/libdiag.so \
    vendor/huawei/ascend/proprietary/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/huawei/ascend/proprietary/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/huawei/ascend/proprietary/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/huawei/ascend/proprietary/libwms.so:system/lib/libwms.so \
    vendor/huawei/ascend/proprietary/libnv.so:system/lib/libnv.so \
    vendor/huawei/ascend/proprietary/libwmsts.so:system/lib/libwmsts.so \
    vendor/huawei/ascend/proprietary/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/huawei/ascend/proprietary/libdss.so:system/lib/libdss.so \
    vendor/huawei/ascend/proprietary/libdll.so:system/lib/libdll.so \
    vendor/huawei/ascend/proprietary/libqmi.so:system/lib/libqmi.so \
    vendor/huawei/ascend/proprietary/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/huawei/ascend/proprietary/libwpa_client.so:system/lib/libwpa_client.so \
    vendor/huawei/ascend/proprietary/qmuxd:system/bin/qmuxd \
    vendor/huawei/ascend/proprietary/hci_qcomm_init:system/bin/hci_qcomm_init

# OEM RPC
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend/proprietary/modempre:system/bin/modempre \
    vendor/huawei/ascend/proprietary/oem_rpc_svc:system/bin/oem_rpc_svc \
    vendor/huawei/ascend/proprietary/libhwrpc.so:system/lib/libhwrpc.so \
    vendor/huawei/ascend/proprietary/liboem_rapi.so:system/lib/liboem_rapi.so

## Wifi related
PRODUCT_COPY_FILES += \
    device/huawei/ascend/modules/bcm4319.ko:system/lib/modules/bcm4319.ko \
    device/huawei/ascend/files/etc/firmware/fw_bcm4319.bin:system/etc/firmware/fw_bcm4319.bin \
    device/huawei/ascend/files/etc/firmware/nvram.txt:system/etc/firmware/nvram.txt

$(call inherit-product, build/target/product/small_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := generic_ascend
PRODUCT_DEVICE := ascend
PRODUCT_MODEL := Huawei Ascend

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-huawei-us \
    ro.com.google.locationfeatures=1 \
    ro.cdma.home.operator.numeric=31016 \
    ro.config.cdma_subscription=1 \
    ro.cdma.voicemail.number=mine \
    ro.setupwizard.enable_bypass=1