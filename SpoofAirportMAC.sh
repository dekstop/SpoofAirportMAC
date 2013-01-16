#!/bin/sh
device=en1

. /etc/rc.common

StartService () {
	ConsoleMessage "Randomising MAC address for ${device}"
	networksetup -setairportpower ${device} on || return 1
	/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -z || return 1
	/sbin/ifconfig ${device} ether 00:`openssl rand -hex 5 | sed 's/\(..\)/\1:/g; s/.$//'` || return 1
	networksetup -detectnewhardware || return 1
}

StopService () {
	return 0
}

RestartService () {
	return 0
}

RunService "$1"
