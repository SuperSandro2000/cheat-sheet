# Docker Swarm Setup

## Table of Contents

- [Docker Swarm Setup](#docker-swarm-setup)
  - [Table of Contents](#table-of-contents)
  - [Instructions](#instructions)
    - [Ports](#ports)
      - [Master node(s)](#master-nodes)
      - [Worker node(s)](#worker-nodes)

## Instructions

- Copy <https://downloads.raspberrypi.org/raspbian_lite_latest> to sd card
- create ssh file in /boot
- ssh into pi
- change password via `passwd`!!!
- rename pi via `hostname=name` to something like `worker-123`. This should be unique!
- sudo `raspi-config` and expand file system
- make sure required ports are open!
- run the setup script via `curl -sSL https://raw.githubusercontent.com/SuperSandro2000/cheat-sheet/master/docker/docker.sh | sudo sh`
- reboot pi
- setup as worker via `sudo curl -sSL https://raw.githubusercontent.com/SuperSandro2000/cheat-sheet/master/docker/docker-rpi-worker.sh | sh`

### Ports

These ports need to be opened beforehand.

#### Master node(s)

Protocol Direction Port Range Purpose TCP Inbound 2377 cluster management communications TCP, UDP Inbound 7946 communication among nodes TCP Inbound 4789 overlay network traffic

#### Worker node(s)

Protocol Direction Port Range Purpose
