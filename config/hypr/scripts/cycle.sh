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
		# If currently fullscreen (not 0), preserve the exact mode on the new
		# window. fullscreen field: 1 = maximized (mod+F), 2 = fullscreen
		# (mod+SHIFT+F). Re-applying without an explicit mode defaults to
		# "fullscreen", which silently promoted maximized windows to fullscreen.
		if [[ "$fs_state" != "0" && "$fs_state" != "null" ]]; then
			if [[ "$fs_state" == "2" ]]; then
				mode="fullscreen"
			else
				mode="maximized"
			fi
			hyprctl dispatch "hl.dsp.window.fullscreen({ action = \"unset\" })"
			hyprctl dispatch "hl.dsp.focus({ window = \"address:${addrs[$next]}\" })"
			hyprctl dispatch "hl.dsp.window.fullscreen({ mode = \"$mode\", action = \"set\" })"
		else
			hyprctl dispatch "hl.dsp.focus({ window = \"address:${addrs[$next]}\" })"
		fi
		exit 0
	fi
done
