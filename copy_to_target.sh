#!/bin/bash

if [ "$1" == "" ]; then
  echo "Missing path to file to send."
  exit -1
fi

if [ "$TARGET_IP" == "" ]; then
  echo "Missing IP address for target (TARGET_IP)."
  exit 0
fi

sshpass -p proot scp $1 root@10.0.2.98:/root/altera_sld_hub_driver.ko


