#!/bin/bash

# goto script dir
cd "$(dirname "$0")"

echo "== Starting Docker containers"
sudo docker-compose up -d

# install service
sudo cp ./docker-compose-app.service /etc/systemd/system/docker-compose-app.service
sudo systemctl enable docker-compose-app

# get that nasty IP
serverip=$(ip route get 8.8.8.8 | awk '{ print $NF; exit }')

echo ""
echo "All done! *yay*"
echo "RPC endpoint: http://$serverip"
echo ""
echo "Have a look at the FAQ: https://nanotools.github.io/easy-nano-node/faq.html"
echo ""
