if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi

curl -fsSL https://download.docker.com/linux/raspbian/gpg | apt-key add -
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
"deb [arch=armhf] https://download.docker.com/linux/raspbian stretch stable" | tee /etc/apt/sources.list.d/kubernetes.list
"deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list

apt-get update
apt-get upgrade -y && apt-get dist-upgrade -y
apt-get install docker-ce kubeadm -y
apt-get autoremove -y && apt-get autoclean -y

dphys-swapfile swapoff && dphys-swapfile uninstall && update-rc.d dphys-swapfile remove
sed -e 's/$/cgroup_enable=cpuset cgroup_enable=memorystring/' -i /boot/cmdline.txt
echo "gpu_mem=16" > file

timedatectl set-timezone Europe/Berlin
usermod $SUDO_USER -aG docker