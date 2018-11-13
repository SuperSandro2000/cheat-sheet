# Sandro's cheat sheet

## Table of Contents
* [Android](android/README.md)
  * [Extract Samung Firmware](android/extract_samsung_firmware/README.md)
  * [Porting](android/README.md#porting)
* [Custom kernel](#custom-kernel)
* [Docker](docker/README.md)
  * [Compose](docker/README.md#compose)
  * [Swarm](docker/README.md#swarm)
    * [Master](docker/README.md#master)
    * [Worker](docker/README.md#worker)
  * [Swarm](docker/swarm-setup/README.md) 
* [Kubernetes](k8s/README.md)
* [Python](#python)
* [Ruby](#ruby)
* [Misc](misc/README.md)
  * [ASF](misc/README.md#asf)
  * [Cron jobs](misc/README.md#cron)
  * [ddclient](misc/README.md#ddclient)
  * [Fail2Ban](misc/README.md#fail2ban)
  * [Gitea](misc/README.md#gitea)
  * [Linux](misc/README.md#linux)
  * [Music](misc/README.md#music)
  * [Rclone](misc/README.md#rclone)
  * [Yunohost](misc/README.md#yunohost)


## Custom kernel
```
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


## Python
```
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
```


## Ruby
```
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
sudo gpg --keyserver hkp://pgp.mit.edu --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

echo 'export rvm_prefix="$HOME"' > /root/.rvmrc
echo 'export rvm_path="$HOME/.rvm"' >> /root/.rvmrc
curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
usermod -aG rvm username
rvm install 2.5
rvm use 2.5 --default
```
