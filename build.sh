#!/bin/bash
# set environment
RAMDISK="../initramfs-voodoo"
CCTC="../x-tools/arm-2009q3/bin/arm-none-eabi-"
# start off clean
make ARCH=arm clean
# prepare source to allow us building of modules first
make -j8 ARCH=arm CROSS_COMPILE=$CCTC prepare
# build modules before kernel
make -j8 ARCH=arm CROSS_COMPILE=$CCTC modules
# build kernel
make -j8 ARCH=arm CROSS_COMPILE=$CCTC
# verify kernel is ready and of good size
ls -alh arch/arm/boot/zImage
cp arch/arm/boot/zImage ../
