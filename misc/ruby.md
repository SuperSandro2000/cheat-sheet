# Ruby

## Table of Contents

- [Install RVM](#install-rvm)

## Install RVM

```shell
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
sudo gpg --keyserver hkp://pgp.mit.edu --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

echo 'export rvm_prefix="$HOME"' >/root/.rvmrc
echo 'export rvm_path="$HOME/.rvm"' >>/root/.rvmrc
curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
usermod -aG rvm user
rvm install 2.5
rvm use 2.5 --default
```
