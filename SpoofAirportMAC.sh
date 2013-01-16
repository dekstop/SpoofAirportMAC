#!/bin/sh

if [ $# == 0 ]; then
	device=en1
elif [ $# == 1 ]; then
	device=$1
else
	echo "<device>"
	exit 1
fi

echo "Randomising MAC address for ${device}"
networksetup -setairportpower ${device} on || exit 1
/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -z || exit 1
/sbin/ifconfig ${device} ether 00:`RANDFILE=/tmp/.rnd openssl rand -hex 5 | sed 's/\(..\)/\1:/g; s/.$//'` || exit 1
networksetup -detectnewhardware || exit 1
