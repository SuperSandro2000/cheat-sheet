# Instructions
- Copy https://downloads.raspberrypi.org/raspbian_lite_latest to sd card
- create ssh file in /boot
- ssh into pi
- change password via ``passwd``!!!
- rename pi via ``hostname=name`` to something like ``worker-123``. This should be unique!
- sudo ``raspi-config`` and expand file system
- make sure required ports are open!
- run the setup script via ``curl -sSL https://raw.githubusercontent.com/SuperSandro2000/cheat-sheet/master/k8s/k8s-rpi.sh | sudo sh``
- reboot pi
- setup as worker via ``sudo curl -sSL https://raw.githubusercontent.com/SuperSandro2000/cheat-sheet/master/k8s/k8s-rpi-worker.sh | sh``

## Ports

These ports need to be opened beforehand.

### Master node(s)
Protocol	Direction	Port Range	Purpose
TCP	      Inbound	  6443*   	  Kubernetes API server
TCP	      Inbound	  2379-2380	  etcd server client API
TCP	      Inbound	  10250	      Kubelet API
TCP	      Inbound	  10251	      kube-scheduler
TCP	      Inbound	  10252	      kube-controller-manager
TCP	      Inbound	  10255	      Read-only Kubelet API

### Worker node(s)
Protocol	Direction	Port Range	Purpose
TCP	      Inbound	  10250	      Kubelet API
TCP	      Inbound	  10255	      Read-only Kubelet API
TCP	      Inbound	  30000-32767	NodePort Services**
