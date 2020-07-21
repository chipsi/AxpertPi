#!/bin/bash

SUDO=
if [ "$UID" != "0" ]; then
	if [ -e /usr/bin/sudo -o -e /bin/sudo ]; then
		SUDO=sudo
	else
		echo '*** This quick installer script requires root privileges.'
		exit 0
	fi
fi

$SUDO apt update
$SUDO apt install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | $SUDO apt-key add -

echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) stable" | \
    $SUDO tee /etc/apt/sources.list.d/docker.list
    
$SUDO apt update
  
$SUDO apt install -y --no-install-recommends \
    docker-ce \
    cgroupfs-mount
    
$SUDO systemctl enable docker
$SUDO systemctl start docker
$SUDO usermod -a -G docker $USER
sg "$(id -gn)"
$SUDO apt install -y python3-pip libffi-dev

$SUDO pip3 install docker-compose

$SUDO git clone https://github.com/BionicWeb/docker-voltronic-homeassistant.git /opt/ha-inverter-mqtt-agent
cd /opt/ha-inverter-mqtt-agent

docker-compose up -d
