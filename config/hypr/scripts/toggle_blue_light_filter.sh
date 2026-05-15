#!/bin/bash

# Define the path to store the current mode
STATE_FILE="$HOME/.hyprshade_mode_state"

# Check if the state file exists and read the current state
if [ -f "$STATE_FILE" ]; then
	STATE=$(cat "$STATE_FILE")
else
	STATE="off"
fi

# Toggle the state
case "$STATE" in
"blue-light-filter")
	# Switch to vibrance mode
	hyprshade on vibrance
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Hyprshade Mode: Vibrance"
	echo "vibrance" >"$STATE_FILE"
	;;
"vibrance")
	# Turn off hyprshade
	hyprshade off
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Hyprshade Mode: Off"
	echo "off" >"$STATE_FILE"
	;;
"off")
	# Switch to blue-light-filter mode
	hyprshade on blue-light-filter
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Hyprshade Mode: Blue Light Filter"
	echo "blue-light-filter" >"$STATE_FILE"
	;;
*)
	# Default to off if state is unknown
	hyprshade off
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Hyprshade Mode: Off"
	echo "off" >"$STATE_FILE"
	;;
esac
