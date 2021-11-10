# ROS2 autobuilder

ROS2 autobuilder is a CI(Continous Integration) system for ROS2onYocto project.

All systems are on Docker containers(build master,worker and janitor)

It is from [yocto-autobuilder](http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder2/) and [helper functions](http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/).

## 0. Features
* yocto project auto build(daily, nightly, periodic)
* git and other repos monitoring and mirroring
* Integration of Bitbake build system

## 1. Prerequisites
* make
* git
* python3 and pip3
* [docker](https://docs.docker.com/engine/install/ubuntu/) and docker-compose

```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null  && \
sudo apt update && \
DEBIAN_FRONTEND=noninteractive sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    git \
    build-essential \
    python3 \
    python3-pip \
    docker-ce \
    docker-ce-cli \
    containerd.io && \
pip3 install docker-compose && \
sudo groupadd docker && \
sudo usermod -aG docker $USER && \
newgrp docker # refresh group members
```

## 2. Installation

```sh
# pull ros2-autobuilder
git clone --recurse-submodules http://mod.lge.com/hub/yezune.choi/ros2-autobuilder
#
cd ros2-autobuilder
# initialize directories
./init-dir.sh

# make docker images
make docker

# start docker-compose
make start

# start docker compose log
make log
```

## ToDo list
- [ ] NFS Server.
- [ ] Support =< buildbot(2.9.x ~ 3.x.x)


