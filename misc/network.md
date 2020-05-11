# Network

## Table of Contents

* [Discover devices](#discover-devices)

## Discover devices

This lists all network devices with hostname (if available), IP address and MAC address in csv format.
The script requires awk, nmap, sudo and coreutils.

```shell
sudo nmap -sP 192.168.178.0/24 | awk '{gsub(/[\(\)]|\;/,"")}/Nmap scan report for [0-9]+.[0-9]+.[0-9]+.[0-9]+/{printf ","$5;}/Nmap scan report for [a-z]/{system("printf "$5"|sed \"
s/\\..*//\"");printf ","$6}/MAC Address:/{print ","$3",";}'
```
