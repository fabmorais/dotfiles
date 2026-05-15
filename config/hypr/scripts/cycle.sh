#!/bin/bash
direction=$1

current_ws=$(hyprctl -j activeworkspace | jq -r '.id')

windows=$(hyprctl -j clients | jq -r --arg ws "$current_ws" '
    [.[] | select(.workspace.id == ($ws | tonumber) and .mapped == true)] | 
    sort_by(.address) | 
    .[] | .address
')

active=$(hyprctl -j activewindow)
current=$(echo "$active" | jq -r '.address')
fs_state=$(echo "$active" | jq -r '.fullscreen')

mapfile -t addrs <<<"$windows"
[[ ${#addrs[@]} -le 1 ]] && exit 0

for i in "${!addrs[@]}"; do
	if [[ "${addrs[$i]}" == "$current" ]]; then
		if [[ "$direction" == "next" ]]; then
			next=$((($i + 1) % ${#addrs[@]}))
		else
			next=$((($i - 1 + ${#addrs[@]}) % ${#addrs[@]}))
		fi
		# If currently fullscreen (not 0), preserve state on new window
		if [[ "$fs_state" != "0" && "$fs_state" != "null" ]]; then
			hyprctl --batch "dispatch fullscreen 0; dispatch focuswindow address:${addrs[$next]}; dispatch fullscreenstate $fs_state"
		else
			hyprctl dispatch focuswindow address:${addrs[$next]}
		fi
		exit 0
	fi
done
