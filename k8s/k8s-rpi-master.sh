sudo kubeadm init
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
export KUBECONFIG=$HOME/.kube/admin.conf

#kubeadm token create --ttl 0 --groups system:bootstrappers:kubeadm:default-node-token --description "Bootstrap token which does not expire"
