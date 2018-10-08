# Sandro's cheat sheet

## Table of Contents
* [Android](android/README.md)
* [Custom kernel](#custom-kernel)
* [ddclient](#ddclient)
* [Docker](#docker)
  * [Compose](#compose)
  * [Swam](#swarm)
    * [Master](#master)
    * [Worker](#worker)
* [Fail2Ban](#fail2ban)
* [Kubernetes](#kubernetes)
* [Python](#python)
* [Ruby](#ruby)
* [Misc](#misc)
  * [ASF](#asf)
  * [Cron jobs](#cron)
  * [Gitea](#gitea)
  * [Linux](#linux)
  * [Music](#music)
  * [Rclone](#rclone)
  * [Yunohost](#yunohost)


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

## ddclient
Replace things in double quotes!
domain.tld is your cloudflare domain you want to update. eg: google.com
```
daemon=600
syslog=yes
mail="user"
mail-failure="user"
pid=/var/run/ddclient.pid
ssl=yes
use=web, web=whatismyip.akamai.com

# CloudFlare
protocol=cloudflare, \
zone="domain.tld", \
ttl=1, \
login=your.user@example.com, \
password="cloudflare api key" \
"domain.tld, my.domain.tld"
```

  
## Docker
```
sudo curl -sSL https://get.docker.com | sh

nano /boot/cmdline.txt
  cgroup_enable=cpuset cgroup_enable=memorystring swapaccount=1

docker images | awk '(NR>1) && ($2!~/none/) {print $1":"$2}' | xargs -L1 docker pull
docker build -t oauth2_proxy-arm .
```

Postgres volume mounts
```
db_test:
  driver: local
  driver_opts:
    type: cifs
    device: //127.0.0.1/docker/db_test
    o: username=USER,password=PASS,uid=70,gid=70,file_mode=0700,dir_mode=0700

db_test:
  driver: local
  driver_opts:
    type: nfs
    o: addr=192.168.178.2,rw
    device: :/nfs/db_test

/etc/exports

/nfs               127.0.0.1(rw,nohide,insecure,no_subtree_check,async,no_root_squash)

curl -LS -H Host:portainer.example.com 192.168.178.2
```

#### Compose
```
sudo apt-get install python-pip && pip install docker-compose
docker-compose up -d --remove-orphans
docker-compose pull && docker-compose up -d --remove-orphans
```

#### Swarm
```
docker plugin install fentas/davfs

wget https://github.com/ContainX/docker-volume-netshare/releases/download/v0.35/docker-volume-netshare_0.35_armhf.deb
sudo dpkg -i docker-volume-netshare_0.35_armhf.deb

docker stack up --compose-file docker-compose.yml --resolve-image never --prune swarm
docker service update swarm_portainer --force

docker swarm update --task-history-limit 3
```


##### Master
```
docker swarm init
docker swarm join-token manager
docker swarm join-token worker
```

#### Worker

Linux
```
docker swarm join --token TOKEN
```

Windows
```
docker-machine create worker
docker-machine env worker
docker-machine ssh worker
```


## Fail2Ban
```
curl -JLO https://github.com/fail2ban/fail2ban/archive/0.10.3.1.tar.gz -o fail2ban-0.10.3.1.tar.gz \
&& tar xf fail2ban-0.10.3.1.tar.gz \
&& rm fail2ban-0.10.3.1.tar.gz \
&& cd fail2ban-0.10.3.1 \
&& sudo python setup.py install
```


## Kubernetes
```
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
apt-get update && apt-get install -y kubeadm

dphys-swapfile swapoff && dphys-swapfile uninstall && update-rc.d dphys-swapfile remove
nano /boot/cmdline.txt
  add at the end: cgroup_enable=cpuset cgroup_enable=memory

kubeadm init --config kubeadm.yaml
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


## Misc

#### ASF
```
sudo apt-get install libunwind8
```

#### Cron
MOST IMPORTANT LINES IN A CRONTAB!
```
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
```

Replace things in double quotes!
```
curl -A 'Bash Updater/1.0 someone@example.com' -i -H 'Authorization:Basic "Base64 user:pw"' -XGET 'dynupdate.no-ip.com/nic/update?hostname="hostname"&myip='$(curl -s http://whatismyip.akamai.com/)
curl 'https://api.dynu.com/nic/update?username="username"&hostname="hostname.dynu.net"&password="sha-256 encoded pw"&myip='$(curl -s http://whatismyip.akamai.com/)
```

#### Gitea
```
mysql -u root -p
mysql> CREATE DATABASE `gitea` DEFAULT CHARACTER SET `utf8mb4` COLLATE `utf8mb4_general_ci`;
mysql> CREATE USER `gitea`@'localhost' IDENTIFIED BY 'password';
mysql> GRANT ALL PRIVILEGES ON `gitea`.* TO `gitea`@`localhost`;
mysql> \q
```

#### Linux
```
passwd -l username
usermod -aG sudo username
mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >>  ~/.ssh/authorized_keys

sudo nano /etc/bash.bashrc
  export LC_ALL=en_GB.UTF-8
  export LANG=en_GB.UTF-8
  export LANGUAGE=en_GB.UTF-8

sudo netstat -tulpn | grep LISTEN
```

#### Music
```
youtube-dl.exe -f m4a --add-metadata -o "%(title)s.%(ext)s" https://www.youtube.com/playlist?list=PLIeMGRbbjabyKx_z0yWcjLCNCgVpDGtFW
```

#### Rclone
```
curl https://rclone.org/install.sh | sudo bash
sudo apt-get install fusermount
```

#### Yunohost
```
pkill -KILL -u pi
bash <(wget -q -O- https://install.yunohost.org/stretch)

yunohost app ssowatconf
```
