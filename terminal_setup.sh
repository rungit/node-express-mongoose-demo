#!/bin/bash

set -x
set -e

apt-get install -y mongodb
apt-get install -y imageMagick 
npm install
cp config/config.example.js config/config.js
cp config/imager.example.js config/imager.js
# node server.js &
sh /srv/cloudlabs/scripts/send_message.sh SERVERMESSAGE '{"type":"write_to_term", "id":"1", "data":"npm start\n"}'
sleep 2
/srv/cloudlabs/scripts/browse.sh 'localhost:3000'
