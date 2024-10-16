#!/bin/bash

DEVICE_MAC="84:D3:52:9D:D4:04"

# echo -e "power on\nagent on\ndefault-agent\npair $DEVICE_MAC\nconnect $DEVICE_MAC\nquit" | bluetoothctl
echo -e "connect $DEVICE_MAC\nquit" | bluetoothctl

notify-send "connected to $DEVICE_MAC"