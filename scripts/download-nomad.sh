#!/bin/bash

NOMAD_VERSION=$1

apt-get update && apt-get install -y curl unzip

curl https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip -o /tmp/nomad.zip

unzip /tmp/nomad.zip -d /usr/local/bin

chmod +x /usr/local/bin/nomad

rm -f /tmp/nomad.zip
