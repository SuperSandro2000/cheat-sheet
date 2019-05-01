# Python

## Table of Contents

* [Upgrade pip](#upgrade-pip)
* [Misc](#misc)

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
