# Yunohost

## Table of Contents

- [Installation](#installation)
- [Misc](#misc)

## Installation

kill everything that runs under pi (required by installation)

```shell
pkill -KILL -u pi
```

One-liner installer

```shell
bash <(wget -q -O- https://install.yunohost.org/stretch)
```

## Misc

```shell
yunohost app ssowatconf
```
