
if  [ ! -n "${1}" ] ;then
  echo "you have not input the ip,input e.p:192.168.2.101/tk8s-master/n192.168.2.102/tk8s-worker"
  exit 1
else
  echo "the config you input are ${1}"
fi

if [ ! -n "${2}" ];then
  echo "master init address is null,e.p:192.168.2.101"
  exit 1
else
  echo "the master addr is ${2}"
fi

echo -e "${1}" >> /etc/hosts
# 使得 apt 支持 ssl 传输
apt-get update && apt-get install -y apt-transport-https
# 下载 gpg 密钥
curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add - 
# 添加 k8s 镜像源
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF
# 更新源列表
apt-get update
# 下载 kubectl，kubeadm以及 kubelet
apt-get install -y kubelet kubeadm kubectl

kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address="${2}"
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

