# Fail2Ban

## Table of Contents

* [Install from source](#install-from-source)

## Install from source

Replace the version number with the latest.

```shell
curl -JLO https://github.com/fail2ban/fail2ban/archive/0.10.3.1.tar.gz -o fail2ban-0.10.3.1.tar.gz && \
tar xf fail2ban-0.10.3.1.tar.gz && \
rm fail2ban-0.10.3.1.tar.gz && \
cd fail2ban-0.10.3.1 && \
sudo python setup.py install
```
