#!/bin/bash

#grep the wireless mode

echo "Grepping the current wireless mode..."
sleep 2
MODE=$(iwconfig wlan0 | grep "Mode" | awk -F ":" {'print $2'} | cut -d " " -f1)
echo "Wireless card set to $MODE mode"
