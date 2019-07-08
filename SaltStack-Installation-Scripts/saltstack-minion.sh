#!/bin/bash

wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
sudo echo "deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" >> /etc/apt/sources.list.d/saltstack.list
sudo apt-get update --allow-insecure-repositories
sudo apt-get install salt-minion
sudo echo "master: 10.2.3.52" >> /etc/salt/minion
sudo systemctl start salt-minion
sudo systemctl enable salt-minion
sudo chmod o+rw /etc/hosts
sudo echo 10.2.3.52 salt | tee –a /etc/hosts
