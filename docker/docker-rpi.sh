#!/bin/sh
if [ "$(whoami)" != "root" ]
then
    echo You need to run this script as sudo!
    exit
fi

curl -fsSL https://download.docker.com/linux/raspbian/gpg | apt-key add -
echo "deb [arch=armhf] https://download.docker.com/linux/raspbian stretch stable" > /etc/apt/sources.list.d/docker.list

apt-get update
apt-get upgrade -y && apt-get dist-upgrade -y
apt-get install docker-ce -y
apt-get autoremove -y

#dphys-swapfile swapoff && dphys-swapfile uninstall && update-rc.d dphys-swapfile remove
if ! grep -q cgroup_enable "/boot/cmdline.txt"; then
  sed -e 's/$/ cgroup_enable=cpuset cgroup_enable=memorystring/' -i /boot/cmdline.txt
fi
if ! grep -q gpu_mem= "/boot/config.txt"; then
  echo "gpu_mem=16" >> /boot/config.txt
fi

timedatectl set-timezone Europe/Berlin
usermod $SUDO_USER -aG docker
