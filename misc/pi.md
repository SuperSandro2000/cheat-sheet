# Pi

## Table of Contents
* [Build Ubuntu](#build-ubuntu)

## Build Ubuntu

Source: [github.com/cirosantilli/linux-cheat](https://github.com/cirosantilli/linux-cheat/blob/master/ubuntu-18.04.1-server-arm64.sh)
```
sudo apt-get install qemu-system-arm qemu-efi

iso=ubuntu-18.10-server-arm64.iso
img="${iso}.img.qcow2"

if [ ! -f "$iso" ]; then
  wget "http://cdimage.ubuntu.com/releases/18.10/release/${iso}"
fi
if [ ! -f "$img" ]; then
  qemu-img create -f qcow2 "$img" 25G
fi
if [ ! -f flash0.img ]; then
  dd if=/dev/zero of=flash0.img bs=1M count=64
  dd if=/usr/share/qemu-efi/QEMU_EFI.fd of=flash0.img conv=notrunc
fi
if [ ! -f flash1.img ]; then
  dd if=/dev/zero of=flash1.img bs=1M count=64
fi

qemu-system-aarch64 \
  -cpu cortex-a57 \
  -device rtl8139,netdev=net0 \
  -device virtio-scsi-device \
  -device scsi-cd,drive=cdrom \
  -device virtio-blk-device,drive=hd0 \
  -drive "file=${iso},id=cdrom,if=none,media=cdrom" \
  -drive "if=none,file=${img},id=hd0" \
  -m 4G \
  -M virt \
  -netdev user,id=net0 \
  -nographic \
  -pflash flash0.img \
  -pflash flash1.img \
  -smp 4 \
;

bzr branch lp:~fo0bar/livecd-rootfs/raspi2-rpi3
qemu-debootstrap --arch arm64 bionic arm64-chroot

mkdir arm64-chroot/build
mv raspi2-rpi3 arm64-chroot/build/
chroot arm64-chroot
cd build/raspi2-rpi3
apt install dpkg-dev debhelper
dpkg-buildpackage -uc -us
dpkg -i ../*.deb
apt --fix-broken install

//mkdir -p build/chroot
//cd build
cd ..

cp -a /usr/share/livecd-rootfs/live-build/auto .
export ARCH=arm64
export SUITE=cosmic
export IMAGEFORMAT=ext4
export SUBARCH=raspi3
export PROJECT=ubuntu-cpc
lb config
lb build
```
