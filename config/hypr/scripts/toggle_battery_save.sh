#!/bin/bash

# Define the path to the state file
STATE_FILE="$HOME/.battery_save_state"

# Check if the state file exists and read the state
if [ -f "$STATE_FILE" ]; then
	STATE=$(cat "$STATE_FILE")
else
	STATE="off"
fi

# Toggle the state
if [ "$STATE" = "off" ]; then
	# Turn on battery save mode
	Hyde power save on
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Battery Save Mode On"
	echo "on" >"$STATE_FILE"
else
	# Turn off battery save mode
	Hyde power save off
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Battery Save Mode Off"
	echo "off" >"$STATE_FILE"
fi
