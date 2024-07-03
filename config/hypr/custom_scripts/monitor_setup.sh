#!/bin/bash

INTERNAL_MONITOR="eDP-1"
EXTERNAL_MONITOR="HDMI-A-1"

# Check connected monitors
connected_monitors=$(hyprctl monitors -j | jq -r '.[].name')

# Disable internal monitor if external monitor is connected
if echo "$connected_monitors" | grep -q "$EXTERNAL_MONITOR"; then
	hyprctl dispatch dpms $INTERNAL_MONITOR off
	hyprctl dispatch dpms $EXTERNAL_MONITOR on
else
	hyprctl dispatch dpms $INTERNAL_MONITOR on
fi
