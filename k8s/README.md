# Instructions
- Copy https://downloads.raspberrypi.org/raspbian_lite_latest to sd card
- create ssh file in /boot
- ssh into pi
- change password via ``passwd``!!!
- rename pi via ``hostname=name`` to something like ``worker-123``. This should be unique!
- sudo ``raspi-config`` and expand file system
- run the setup script via ``sudo curl -sSL https://raw.githubusercontent.com/SuperSandro2000/cheat-sheet/master/k8s/k8s-rpi.sh | sh``
- reboot pi
- run ``sudo curl -sSL https://raw.githubusercontent.com/SuperSandro2000/cheat-sheet/master/k8s/k8s-rpi-worker.sh | sh``
