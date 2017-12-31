#!/bin/bash

#check if media access control address is being spoofed or not
#create a function to test wether or not macchanger was even used after bootup

ORIGINAL_ADDRESS=$(macchanger wlan0 -s | grep "Permanent MAC:" | cut -d " " -f3)
SPOOFED_ADDRESS=$(macchanger wlan0 -s | grep "Current MAC:" | cut -d " " -f5)

checkSpoof(){
	#check to see if a spoofed adress exists
	local wasRun=$(macchanger wlan0 -s | grep "Current MAC:" | cut -d " " -f5)
	
	#if the current return variable is empty, the program was not run
	if [ $wasRun == $ORIGINAL_ADDRESS ]; then
		echo "Status: Not spoofed"
		echo "Hardware Address: $ORIGINAL_ADDRESS"
		echo "Spoofed Address: None"
	elif [ $wasRun != $ORIGINAL_ADDRESS ]; then
		echo "Status: Spoofed"
		echo "New Address: $SPOOFED_ADDRESS"
		echo "Hardware Address: $ORIGINAL_ADDRESS"
	else
		echo "Status: Unknown"
		echo "Hardware Address: $ORIGINAL_ADDRESS"
		echo "Spoofed Address: $SPOOFED_ADDRESS"
	fi
return
}

#run the function to check if the source mac address was spoofed or not
checkSpoof

