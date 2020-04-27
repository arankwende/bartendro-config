#!/bin/bash

apt update
apt install -y --no-install-recommends nginx uwsgi uwsgi-plugin-python \
    python-dev python-smbus git-core python-pip python-setuptools python-wheel


hostname bartendro

# install the network/wifi setup files
cp -v files/config.txt /boot
cp -v files/sudoers /etc
cp -v files/rc.local /etc/rc.local
cp -v files/hostname /etc

# create the bartendro user if need be
sudo adduser -gecos 'Bartendro' --disabled-password bartendro
sudo adduser bartendro sudo 
echo 'bartendro:hackme!' | sudo chpasswd

# check out bartendro source
if [ ! -d "/home/bartendro/bartendro" ]; then
    git clone https://github.com/partyrobotics/bartendro.git /home/bartendro/bartendro
    cp /home/bartendro/bartendro/ui/bartendro.db.default /home/bartendro/bartendro/ui/bartendro.db
    chown -R bartendro:bartendro /home/bartendro
fi

# Install the needed python modules
pip install -r /home/bartendro/bartendro/ui/requirements.txt

# configure nginx & uwsgi
cp -v files/nginx.conf /etc/nginx
cp -v files/nginx-default /etc/nginx/sites-available/default
cp -v files/bartendro.ini /etc/uwsgi/apps-available
ln -fs /etc/uwsgi/apps-available/bartendro.ini /etc/uwsgi/apps-enabled/bartendro.ini 

# change the ownership of everything in the bartendro user
chown -R bartendro:bartendro /home/bartendro
