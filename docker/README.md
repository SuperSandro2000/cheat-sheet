# Docker

## Table of Contents

- [General](#general)
- [Compose](#compose)
- [Swarm](#swarm)

  - [Master](#master)
  - [Worker](#worker)

- [Swarm setup](swarm-setup/README.md)

- [Postgres](#postgres)
- [Misc](#misc)

## General

Install docker

```shell
sudo curl -sSL https://get.docker.com | sh
sudo groupadd docker
sudo usermod -aG docker $USER
```

Enabling memory cgrouping and disable swap

```shell
nano /boot/cmdline.txt
  cgroup_enable=cpuset cgroup_enable=memorystring swapaccount=1
```

Update all docker images

```shell
docker images | awk '(NR>1) && ($2!~/none/) {print $1":"$2}' | xargs -L1 docker pull
```

Build the docker image described in Dockerfile and tag it

```shell
docker build -t example-arm . -f Dockerfile
```

Curl a specified host behind traefik

```shell
curl -LS -H Host:portainer.example.com 192.168.2.0
```

Install a plugin

```shell
docker plugin install fentas/davfs
```

## Compose

Install compose

```shell
sudo apt install python-pip && pip install -U docker-compose
```

Up a compose file and remove old container.

```shell
docker-compose up -d --remove-orphans
```

Pull and up all container

```shell
docker-compose pull && docker-compose up -d --remove-orphans
```

## Swarm

Install docker-volume-netshare

```shell
wget https://github.com/ContainX/docker-volume-netshare/releases/download/v0.35/docker-volume-netshare_0.35_armhf.deb
sudo dpkg -i docker-volume-netshare_0.35_armhf.deb
```

Create a stack on armhf architecture.

```shell
docker stack up --compose-file docker-compose.yml --resolve-image never --prune swarm
```

Force update a service

```shell
docker service update swarm_portainer --force
```

Limit the stopped container docker should keep. Use 0 to remove them instantly. (Default: 5)

```shell
docker swarm update --task-history-limit 3
```

### Master

Create a docker swarm

```shell
docker swarm init
```

Show the respective join token again.

```shell
docker swarm join-token manager
docker swarm join-token worker
```

## Worker

To join a swarm as a worker run the following on:

### Linux

```shell
docker swarm join --token TOKEN
```

### Windows

```shell
docker-machine create worker
docker-machine env worker
docker-machine ssh worker
docker swarm join --token TOKEN
```

## Postgres

Postgres volume mounts in docker compose

```shell
db_test:
  driver: local
  driver_opts:
    type: cifs
    device: //127.0.0.1/docker/db_test
    o: username=USER,password=PASS,uid=70,gid=70,file_mode=0700,dir_mode=0700

db_test:
  driver: local
  driver_opts:
    type: nfs
    o: addr=192.168.178.2,rw
    device: :/nfs/db_test
```

Required nfs server exports

```shell
sudo nano /etc/exports

/nfs               127.0.0.1(rw,nohide,insecure,no_subtree_check,async,no_root_squash)
```

## Misc

Run docker image with `.env` file.

```shell
docker run -it --rm --env-file ~/.env alpine /bin/ash
```
