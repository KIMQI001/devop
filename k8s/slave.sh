
if  [ ! -n "${1}" ] ;then
  echo "you have not input the ip,input e.p:192.168.2.101/tk8s-master/n192.168.2.102/tk8s-worker"
  exit 1
else
  echo "the config you input are ${1}"
fi

echo -e "${1}" >> /etc/hosts
echo "deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted" > /etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted" >> /etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/ubuntu/ xenial universe" >> /etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe" >> /etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse" >> /etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb https://mirrors.aliyun.com/kubernetes/apt kubernetes-xenial main" >> /etc/apt/sources.list
apt-get install docker.io
wait
apt-get update && apt-get install -y kubelet kubeadm kubectl --allow-unauthenticated

echo "please run the kube join"
