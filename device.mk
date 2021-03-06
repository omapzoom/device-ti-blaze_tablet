#
# Copyright (C) 2011 Texas Instruments Inc.
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

DEVICE_PACKAGE_OVERLAYS := device/ti/blaze_tablet/overlay

PRODUCT_PACKAGES := \
    ti_omap4_ducati_bins \
    libOMX_Core \
    libOMX.TI.DUCATI1.VIDEO.DECODER

# Tiler
PRODUCT_PACKAGES += \
    libtimemmgr

#HWC Hal
PRODUCT_PACKAGES += \
    hwcomposer.omap4

#Lib Skia test
PRODUCT_PACKAGES += \
    SkLibTiJpeg_Test

# Camera
PRODUCT_PACKAGES += \
    CameraOMAP4 \
    Camera \
    camera_test

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/ti/blaze_tablet/boot/zImage
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

#Need to revisit the fastboot copy files
PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel \
	device/ti/blaze_tablet/init.omap4blazeboard.rc:root/init.omap4blazeboard.rc \
	device/ti/blaze_tablet/init.omap4blazeboard.usb.rc:root/init.omap4blazeboard.usb.rc \
	device/ti/blaze_tablet/ueventd.omap4blazeboard.rc:root/ueventd.omap4blazeboard.rc \
	device/ti/blaze_tablet/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	device/ti/blaze_tablet/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	device/ti/blaze_tablet/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl \
	device/ti/blaze_tablet/qtouch-touchscreen.idc:system/usr/idc/qtouch-touchscreen.idc \
        device/ti/blaze_tablet/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	device/ti/blaze_tablet/bootanimation.zip:/data/local/bootanimation.zip

# to mount the external storage (sdcard)
PRODUCT_COPY_FILES += \
        device/ti/blaze_tablet/vold.fstab:system/etc/vold.fstab

PRODUCT_PACKAGES += \
	lights.blaze_tablet

#Remove this as it freezes at boot. Will re-enable once fixed
PRODUCT_PACKAGES += \
	sensors.blaze_tablet \
	sensor.test

PRODUCT_PACKAGES += \
       boardidentity \
       libboardidentity \
       libboard_idJNI \
       Board_id

PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers \
        librs_jni

PRODUCT_PACKAGES += \
	VideoEditorGoogle

PRODUCT_PROPERTY_OVERRIDES := \
	hwui.render_dirty_regions=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
	persist.hwc.mirroring.region=0:0:1280:720

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# WI-Fi
PRODUCT_PACKAGES += \
	dhcpcd.conf \
	hostapd.conf \
	wifical.sh \
	TQS_D_1.7.ini \
	TQS_D_1.7_127x.ini \
	crda \
	regulatory.bin \
	calibrator

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# Audio HAL module
PRODUCT_PACKAGES += audio.primary.blaze_tablet

# Audioout libs
PRODUCT_PACKAGES += libaudioutils

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# BlueZ a2dp Audio HAL module
PRODUCT_PACKAGES += audio.a2dp.default

# BlueZ test tools
PRODUCT_PACKAGES += \
	hciconfig \
	hcitool

# SMC components for secure services like crypto, secure storage
PRODUCT_PACKAGES += \
        smc_pa.ift \
        smc_normal_world_android_cfg.ini \
        libsmapi.so \
        libtf_crypto_sst.so \
        libtfsw_jce_provider.so \
        tfsw_jce_provider.jar \
        tfctrl

$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product-if-exists, vendor/ti/proprietary/omap4/ti-omap4-vendor.mk)
$(call inherit-product-if-exists, vendor/ti/blaze/device-vendor.mk)
$(call inherit-product-if-exists, hardware/ti/wpan/ti-wpan-products.mk)
