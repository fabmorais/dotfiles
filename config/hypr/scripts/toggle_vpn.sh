#!/bin/bash

if pgrep -x "openvpn" >/dev/null; then
    # Close the openvpn process
    sudo killall openvpn
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "OpenVPN Disconnected"
else
    # mullvad-exclude sudo openvpn --config "$HOME"/Documents/vpn/client.ovpn --daemon
    sudo openvpn --config "$HOME"/Documents/vpn/client.ovpn --daemon
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "OpenVPN Connected"
fi
