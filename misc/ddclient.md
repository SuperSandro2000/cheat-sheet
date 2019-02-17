# DDClient

## Table of Contents
* [Example config file](#example-config-file)

## Example config file
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
