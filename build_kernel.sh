#! /bin/bash

# Export build variables
export KBUILD_BUILD_USER="localhost"
export KBUILD_BUILD_HOST="localhost"
export PLATFORM_VERSION=11
export ANDROID_MAJOR_VERSION=r
export CROSS_COMPILE=prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export ARCH=arm64

make clean
make exynos7885-a30s_defconfig
make

cp arch/arm64/boot/Image AnyKernel3/

cd AnyKernel3
zip -r9 out.zip anykernel.sh dtb.img dtbo.img Image version tools/* META-INF/com/google/android/*
cd ..
