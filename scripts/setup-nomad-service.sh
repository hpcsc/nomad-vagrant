#!/bin/bash

CONFIG_TYPE=$1
SERVER_IP=$2
IP=$3

cat /vagrant/config/${CONFIG_TYPE}/config.hcl | \
  sed 's/{server-ip}/'${SERVER_IP}'/g' | \
  sed 's/{ip}/'${IP}'/g' > /usr/local/etc/config.hcl

sudo cp -v /vagrant/config/${CONFIG_TYPE}/nomad.service /etc/systemd/system/nomad.service

sudo systemctl enable nomad.service

sudo systemctl start nomad.service
