# Linux

## Table of Contents
* [Users](#users)
* [Profile](#profile)
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


## Misc

Listen all local ports that are listed to.
```
sudo netstat -tulpn | grep LISTEN
```

Remove config files from removed packages.
```
awk '/rc / {print $2}' <(dpkg -l) | xargs sudo apt purge
```
