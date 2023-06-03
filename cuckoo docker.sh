#Cai dat docker
sudo apt update -y && apt upgrade -y

$ sudo apt install docker.io

$ sudo systemctl enable --now docker

$ sudo systemctl disable --now docker

$ sudo usermod -aG docker vsudo && newgrp docker

$ docker --version

$ docker run hello-world
# Cai dat git
sudo apt install git
git --version 
# clone github
$ git clone https://github.com/blacktop/docker-cuckoo$ cd docker-cuckoo$ docker-compose up -d
cd ~/docker-cuckoo
docker-compose up -d
docker-compose ps
# run cuckoo
cuckoo web

