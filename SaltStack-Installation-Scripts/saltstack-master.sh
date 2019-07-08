#!/bin/bash

wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
"deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" >> /etc/apt/sources.list.d/saltstack.list
sudo apt-get update --allow-insecure-repositories
sudo apt-get install salt-master salt-minion
sudo systemctl start salt-master
sudo systemctl enable salt-master
sudo systemctl start salt-minion
sudo systemctl enable salt-minion
sudo firewall-cmd --permanent --zone=public --add-port=4505-4506/tcp
sudo firewall-cmd –reload
mkdir /srv/salt
sudo salt-key –A
