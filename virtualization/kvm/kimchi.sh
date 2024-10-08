#!/bin/bash

# down load the kimchi
# from https://github.com/kimchi-project/kimchi/releases/tag/2.5.0
apt-get install nginx
wget -c https://github.com/kimchi-project/kimchi/releases/download/2.5.0/wok-2.5.0-0.noarch.deb

# download the ginger for the host management plugin for the kimchi.
wget -c http://kimchi-project.github.io/gingerbase/downloads/latest/ginger-base.noarch.deb
wget -c https://github.com/kimchi-project/kimchi/releases/download/2.5.0/kimchi-2.5.0-0.noarch.deb

dpkg -i wok-2.5.0-0.noarch.deb
apt-get install -f

service wokd start
dpkg -i ginger-base.noarch.deb
apt-get install -f
service wokd restart


dpkg -i kimchi-2.5.0-0.noarch.deb
apt-get install -f

#If you have UFW enabled please add the port
ufw allow 8001/tcp

#reboot here
sudo shutdown -r now


#https://Server_IP:8001
#http://Server_IP:8000
