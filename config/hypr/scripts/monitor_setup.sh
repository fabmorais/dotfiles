#!/bin/bash

INTERNAL_MONITOR="eDP-1"
# EXTERNAL_MONITOR="HDMI-A-1"
EXTERNAL_MONITOR="DP-3"

# Check connected monitors
connected_monitors=$(hyprctl monitors -j | jq -r '.[].name')

# Disable internal monitor if external monitor is connected
if echo "$connected_monitors" | grep -q "$EXTERNAL_MONITOR"; then
	hyprctl dispatch "hl.dsp.dpms({ action = \"disable\", monitor = \"$INTERNAL_MONITOR\" })"
	hyprctl dispatch "hl.dsp.dpms({ action = \"enable\", monitor = \"$EXTERNAL_MONITOR\" })"
else
	hyprctl dispatch "hl.dsp.dpms({ action = \"enable\", monitor = \"$INTERNAL_MONITOR\" })"
fi
