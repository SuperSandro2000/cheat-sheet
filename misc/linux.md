# Linux

## Table of Contents

- [Users](#users)
- [Profile](#profile)
- [Misc](#misc)

## Users

Remove the password of user to disallow login via login shell or ssh.

```shell
passwd -l user
```

Add a user to a group.

```shell
usermod -aG sudo user
```

## Profile

Create .ssh folder

```shell
mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >>~/.ssh/authorized_keys
```

Set language on stubborn systems.

```shell
sudo nano /etc/bash.bashrc
  export LC_ALL=en_GB.UTF-8
  export LANG=en_GB.UTF-8
  export LANGUAGE=en_GB.UTF-8
```

## Misc

Listen all local ports that are listed to.

```shell
sudo netstat -tulpn | grep LISTEN
```

Remove config files from removed packages.

```shell
awk '/rc / {print $2}' <(dpkg -l) | xargs sudo apt purge -y
```
