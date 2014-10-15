Here Sony Xperia acro Z device folder for build latest AOSP software

1. Download the AOSP source codes:
----------------------------------
- All info you can find in wiki or from other source

2. Download my source codes:
----------------------------
- cd your_android_source_codes_dir
- git clone git://github.com/paul-xxx/android_device_somc_hazard.git -b aosp-kk device/somc/hazard
- git clone git://github.com/paul-xxx/android_kernel_somc_hazard.git -b aosp-kk kernel/somc/hazard (Still no available)
- And other components from this git repo

3. Build ROM:
-------------
- cd your_android_source_codes_dir
- source build/envsetup.sh && lunch aosp_hazard-userdebug
- make otapackage -j10
