#!/bin/bash
cd "${0%/*}"
. ${HOCO_HOME}/data/config.sh
if [ -z "$HOCO_ZIGBEE_DEVICE" ]; then 
  export HOCO_ZIGBEE_DEVICE=/dev/ttyACM1
fi
npm install
echo '{' > config.json
echo ' "mqtt": {'>> config.json
echo '  "url": "'${HOCO_MQTT_URL}'",'>> config.json
echo '  "username": "'${HOCO_MQTT_USER}'",'>> config.json
echo '  "password": "'${HOCO_MQTT_PASS}'",'>> config.json
echo '  "prefix": "'${HOCO_MQTT_PREFIX}'"'>> config.json
echo ' },'>> config.json
echo ' "adapter": ['>> config.json
echo '  {'>> config.json
echo '   "type": "zigbee",'>> config.json
echo '   "module": "zigbee",'>> config.json
echo '   "device": "'${HOCO_ZIGBEE_DEVICE}'"'>> config.json
echo '  }'>> config.json
echo ' ]'>> config.json
echo '}'>> config.json
sudo cp hoco-zigbee.service /etc/systemd/system/
sudo systemctl enable hoco-zigbee.service
