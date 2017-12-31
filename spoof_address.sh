#!/bin/bash

#spoof mac address, or retain a new mac address
getSpoof(){
	#grep the current hardware address
	#implement from ifconfig wlan0 to get addr rather than macchanger GNU
	local GET_ADDR=$(macchanger wlan0 -s | grep "Permanent MAC:" | cut -d " " -f3)
	ifconfig wlan0 down
	macchanger wlan0 -r
	echo ""
	NEW_ADDR=$(macchanger wlan0 -s | grep "Current MAC:" | cut -d " " -f5)
	ifconfig wlan0 up 
	echo "State: Spoofed"
	echo "Status: Aquired new hardware address"
	echo "Spoofed Address: $NEW_ADDR"
	echo "Hardware Address: $GET_ADDR"
	echo ""
	echo "*It is recommended to spoof your mac address on every boot*"
return
}

getSpoof
