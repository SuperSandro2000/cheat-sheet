# Linux

## Table of Contents
* [Users](#users)
* [Profile](#profile)
* [Raspberry Pi Buster Upgrade](#raspberry-pi-buster-ugrade)
* [Misc](#misc)

## Users

Remove the password of user to disallow login via login shell or ssh.
```
passwd -l user
```

Add a user to a group.
```
usermod -aG sudo user
```

## Profile

Create .ssh folder
```
mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >>  ~/.ssh/authorized_keys
```

Set language on stubborn systems.
```
sudo nano /etc/bash.bashrc
  export LC_ALL=en_GB.UTF-8
  export LANG=en_GB.UTF-8
  export LANGUAGE=en_GB.UTF-8
```

## Raspberry Pi Buster Upgrade

Upgrade the Raspberry Pi to Debian Buster. Currently Buster is testing and may contain bugs. Some packages do not work yet and are suggested to be removed.
It may be necessary to manually upgrade apt sources in `/etc/apt/sources.list.d/`.
```
sudo apt purge freeipmi-ipmidetect freeipmi
sed -i -e 's/wheezy/buster/g' /etc/apt/sources.list
apt update
DEBIAN_FRONTEND=noninteractive DEBIAN_PRIORITY=critical apt -y -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" dist-upgrade
DEBIAN_FRONTEND=noninteractive DEBIAN_PRIORITY=critical apt -y -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" autoremove --purge
reboot
```

## Misc

Listen all local ports that are listed to.
```
sudo netstat -tulpn | grep LISTEN
```

Remove config files from removed packages.
```
awk '/rc / {print $2}' <(dpkg -l) | xargs sudo apt purge
```
