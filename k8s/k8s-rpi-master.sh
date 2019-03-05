echo "apiVersion: kubeadm.k8s.io/v1alpha1
kind: MasterConfiguration
controllerManagerExtraArgs:
  pod-eviction-timeout: 10s" >>kubeadm_conf.yaml
sudo kubeadm init --config kubeadm_conf.yaml
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#kubeadm token create --ttl 0 --groups system:bootstrappers:kubeadm:default-node-token --description "Bootstrap token which does not expire"
