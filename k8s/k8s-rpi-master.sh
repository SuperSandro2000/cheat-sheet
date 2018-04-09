if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi

kubeadm init
mkdir -p $SUDO_USER/.kube
cp -i /etc/kubernetes/admin.conf $SUDO_USER/.kube/config
chown $(id -u):$(id -g) $SUDO_USER/.kube/config

#kubeadm token create --ttl 0 --groups system:bootstrappers:kubeadm:default-node-token --description "Bootstrap token which does not expire"
