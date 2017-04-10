#!/bin/bash
cd "${0%/*}"
. ${HOCO_HOME}/data/config.sh
sudo systemctl stop hoco-zigbee.service
npm install
sudo cp setup/hoco-zigbee.service /etc/systemd/system/
sudo systemctl enable hoco-zigbee.service
