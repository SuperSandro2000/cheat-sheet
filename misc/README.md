# Misc

## Table of Contents
* [ASF](#asf)
* [Cron jobs](#cron)
* [ddclient](#ddclient)
* [Fail2Ban](#fail2ban)
* [Gitea](#gitea)
* [Linux](#linux)
* [Music](#music)
* [Rclone](#rclone)
* [Yunohost](#yunohost)


## ASF
```
sudo apt-get install libunwind8
```

## Cron
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


## Fail2Ban
```
curl -JLO https://github.com/fail2ban/fail2ban/archive/0.10.3.1.tar.gz -o fail2ban-0.10.3.1.tar.gz \
&& tar xf fail2ban-0.10.3.1.tar.gz \
&& rm fail2ban-0.10.3.1.tar.gz \
&& cd fail2ban-0.10.3.1 \
&& sudo python setup.py install
```


## Gitea
```
mysql -u root -p
mysql> CREATE DATABASE `gitea` DEFAULT CHARACTER SET `utf8mb4` COLLATE `utf8mb4_general_ci`;
mysql> CREATE USER `gitea`@'localhost' IDENTIFIED BY 'password';
mysql> GRANT ALL PRIVILEGES ON `gitea`.* TO `gitea`@`localhost`;
mysql> \q
```

## Linux
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

## Music
```
youtube-dl.exe -f m4a --add-metadata -o "%(title)s.%(ext)s" https://www.youtube.com/playlist?list=PLIeMGRbbjabyKx_z0yWcjLCNCgVpDGtFW
```

## Rclone
```
curl https://rclone.org/install.sh | sudo bash
sudo apt-get install fusermount
```

## Yunohost
```
pkill -KILL -u pi
bash <(wget -q -O- https://install.yunohost.org/stretch)

yunohost app ssowatconf
```
