# 마스터노드 설정
kubeadm init --control-plane-endpoint "10.0.2.10:6443" --pod-network-cidr=192.168.0.0/16

# 올바른 결과창 예시
# You can now join any number of control-plane nodes by copying certificate authorities
# and service account keys on each node and then running the following as root:
# 
#   kubeadm join 10.0.2.10:6443 --token agzq6v.xvh43243243243 \
# 	--discovery-token-ca-cert-hash sha256:1207071d4f62de1234559aedf5345354334465467e3cbf4234234223f87430c \
# 	--control-plane 
# 
# Then you can join any number of worker nodes by running the following on each as root:
# 
# kubeadm join 10.0.2.10:6443 --token agzq6v.xvh43243243243 \
# 	--discovery-token-ca-cert-hash sha256:1207071d4f62de1234559aedf5345354334465467e3cbf4234234223f87430c

# kubectl 설정
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# CRI 매니페스트 적용
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml


# 워커 노드 설정
# 워커에서 마스터로 조인
kubeadm join 10.0.2.10:6443 --token agzq6v.xvh43243243243 \
	--discovery-token-ca-cert-hash sha256:1207071d4f62de1234559aedf5345354334465467e3cbf42342342

# 조인 후 다시 마스터에서
kubectl get nodes

# 확인 (아래 중 하나 실행)
kubectl cluster-info
kubectl get nodes
systemctl status kubelet
kubectl get nodes -o wide

# 참고) 토큰 재발급
kubeadm create token