# Python

## Table of Contents

* [Misc](#misc)

## Misc

Upgrade all python packages.

```shell
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
```
