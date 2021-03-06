#!/bin/bash
cd "${0%/*}"
. ${HOCO_HOME}/data/config.sh
if [ -z "$HOCO_ZIGBEE_DEVICE" ]; then
  export HOCO_ZIGBEE_DEVICE=/dev/ttyUSB0
fi
npm install
cd ..
echo '{' > config.json
echo ' "adapter": ['>> config.json
echo '  {'>> config.json
echo '   "type": "zigbee",'>> config.json
echo '   "module": "zigbee",'>> config.json
echo '   "device": "'${HOCO_ZIGBEE_DEVICE}'"'>> config.json
echo '  }'>> config.json
echo ' ]'>> config.json
echo '}'>> config.json
sudo cp setup/hoco-zigbee.service /etc/systemd/system/
sudo systemctl enable hoco-zigbee.service
