# Docker

## Table of Contents
* [General](#general)
* [Compose](#compose)
* [Swarm](#swarm)
  * [Master](#master)
  * [Worker](#worker)
* [Swarm](docker/swarm-setup/README.md)  
* [Postgres](#postgres)
* [Misc](#misc)


## General

Install docker
```
sudo curl -sSL https://get.docker.com | sh
sudo groupadd docker
sudo usermod -aG docker $USER
```

Enabling memory cgrouping and disable swap 
```
nano /boot/cmdline.txt
  cgroup_enable=cpuset cgroup_enable=memorystring swapaccount=1
```

Update all docker images
```
docker images | awk '(NR>1) && ($2!~/none/) {print $1":"$2}' | xargs -L1 docker pull
```

Build the docker image described in Dockerfile and tag it
```
docker build -t example-arm . -f Dockerfile
```

Curl a specified host behind traefik
```
curl -LS -H Host:portainer.example.com 192.168.2.0
```


## Compose

Install compose
```
sudo apt-get install python-pip && pip install -U docker-compose
```

Up a compose file and remove old container.
```
docker-compose up -d --remove-orphans
```

Pull and up all container
```
docker-compose pull && docker-compose up -d --remove-orphans
```

## Swarm

Install a plugin
```
docker plugin install fentas/davfs
```

Install docker-volume-netshare
```
wget https://github.com/ContainX/docker-volume-netshare/releases/download/v0.35/docker-volume-netshare_0.35_armhf.deb
sudo dpkg -i docker-volume-netshare_0.35_armhf.deb
```

Create a stack on armhf architecture.
```
docker stack up --compose-file docker-compose.yml --resolve-image never --prune swarm
```

Force update a service
```
docker service update swarm_portainer --force
```

Limit the stopped container docker should keep. Use 0 to remove them instantly. (Default: 5)
```
docker swarm update --task-history-limit 3
```


### Master

Create a docker swarm
```
docker swarm init
```
Show the respective join token again.
```
docker swarm join-token manager
docker swarm join-token worker
```

## Worker

To join a swarm as a worker run the following on:
Linux
```
docker swarm join --token TOKEN
```

Windows
```
docker-machine create worker
docker-machine env worker
docker-machine ssh worker
docker swarm join --token TOKEN
```


## Postgres

Postgres volume mounts in docker compose
```
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
```
sudo nano /etc/exports

/nfs               127.0.0.1(rw,nohide,insecure,no_subtree_check,async,no_root_squash)
```


## Misc

Run docker image with ``.env`` file.
```
docker run -it --rm --env-file ~/.env alpine /bin/ash
```
