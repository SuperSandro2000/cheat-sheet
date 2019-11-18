# Python

## Table of Contents

* [Package Debian Packets](#package-debian-packets)
* [Upgrade pip](#upgrade-pip)
* [Misc](#misc)

## Package Debian Packets

* Comparison of stdeb, fpm, dh- virtualenv, vdist: [dlab.ninja/2015/11/packaging-python-programs-debian-and](https://www.dlab.ninja/2015/11/packaging-python-programs-debian-and.html)
* [Py2Deb](https://github.com/paylogic/py2deb)
* [Wheel2Deb](https://github.com/parkoview/wheel2deb)

## Upgrade pip

upgrade pip correctly that it works without sudo

```shell
sudo -H pip3 install --upgrade pip
```

## Misc

Upgrade all python packages.

```shell
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
```
