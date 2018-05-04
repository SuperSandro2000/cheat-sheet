# Sandro's cheat sheet

## Table of Contents
* [Custom kernel](#custom-kernel)
* [Docker](#docker)
  * [Compose](#compose)
  * [Swam](#swarm)
* [Kubernetes](#kubernetes)
* [Misc](#misc)
  * [ASF](#asf)
  * [Cron jobs](#cron)
  * [Gitea](#gitea)
  * [Linux](#linux)
  * [Music](#music)
  * [Yunohost](#yunohost)

## Docker
````
sudo curl -sSL https://get.docker.com | sh
docker images | awk '(NR>1) && ($2!~/none/) {print $1":"$2}' | xargs -L1 docker pull
docker build -t oauth2_proxy-arm .
````

#### Compose
````
sudo apt-get install python-pip
sudo pip install docker-compose
docker-compose up -d --remove-orphans
````

#### Swarm

##### Master
````
docker swarm init

nano /boot/cmdline.txt
  cgroup_enable=cpuset cgroup_enable=memorystring swapaccount=1
````

#### Slave

Linux
````
docker swarm join --token TOKEN
````

Windows
````
docker-machine create worker
docker-machine env worker
docker-machine ssh worker
````


## Custom kernel
````
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
````


## Kubernetes
````
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
apt-get update && apt-get install -y kubeadm

dphys-swapfile swapoff && dphys-swapfile uninstall && update-rc.d dphys-swapfile remove
nano /boot/cmdline.txt
  add at the end: cgroup_enable=cpuset cgroup_enable=memory

kubeadm init --config kubeadm.yaml
````


## Misc

#### ASF
````
sudo apt-get install libunwind8
````

#### Cron
Replace things in double quotes
````
curl -A 'Bash Updater/1.0 someone@example.com' -i -H 'Authorization:Basic "Base64 user:pw"' -XGET 'dynupdate.no-ip.com/nic/update?hostname="hostname"&myip='$(curl -s http://whatismyip.akamai.com/)
curl 'https://api.dynu.com/nic/update?username="username"&hostname="hostname.dynu.net"&password="sha-256 encoded pw"&myip='$(curl -s http://whatismyip.akamai.com/)
````

#### Gitea
````
mysql -u root -p
mysql> CREATE DATABASE `gitea` DEFAULT CHARACTER SET `utf8mb4` COLLATE `utf8mb4_general_ci`;
mysql> CREATE USER `gitea`@'localhost' IDENTIFIED BY 'password';
mysql> GRANT ALL PRIVILEGES ON `gitea`.* TO `gitea`@`localhost`;
mysql> \q
````

#### Linux
````
passwd -l username
usermod -aG sudo username
mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >>  ~/.ssh/authorized_keys

sudo nano /etc/bash.bashrc
  export LC_ALL=en_GB.UTF-8
  export LANG=en_GB.UTF-8
  export LANGUAGE=en_GB.UTF-8
````

#### Music
````
youtube-dl.exe -f m4a --add-metadata -o "%(title)s.%(ext)s" https://www.youtube.com/playlist?list=PLIeMGRbbjabyKx_z0yWcjLCNCgVpDGtFW
````

#### Yunohost
````
pkill -KILL -u pi
bash <(wget -q -O- https://install.yunohost.org/stretch)

yunohost app ssowatconf
````
