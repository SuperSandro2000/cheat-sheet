# Linux Kernel

## Table of Contents

* [Cross-Compile RPI kernel](#cross-compile-rpi-kernel)

## Cross-Compile RPI kernel

```shell
sudo SKIP_KERNEL=1 rpi-update

cd linux
KERNEL=kernel7
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2709_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig

make -j6 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- zImage modules dtbs

mkdir mnt
mkdir mnt/fat32
mkdir mnt/ext4
sudo mount /dev/sdc1 mnt/fat32
sudo mount /dev/sdc2 mnt/ext4

sudo env "PATH=$PATH" make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=mnt/ext4 modules_install

sudo cp arch/arm/boot/zImage mnt/fat32/kernel7-ksm.img
sudo cp arch/arm/boot/dts/*.dtb mnt/fat32/
sudo cp arch/arm/boot/dts/overlays/*.dtb* mnt/fat32/overlays/
sudo cp arch/arm/boot/dts/overlays/README mnt/fat32/overlays/
sudo umount mnt/fat32
sudo umount mnt/ext4
```
