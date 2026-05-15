#!/bin/sh
asusctl profile -n
pkill -SIGRTMIN+8 waybar
PWR=$(asusctl profile -p | grep 'Active profile is' | awk '{print $NF}')
notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Power Profile changed to $PWR"
