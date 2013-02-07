#!/bin/sh

mac=00:`RANDFILE=/tmp/.rnd openssl rand -hex 5 | sed 's/\(..\)/\1:/g; s/.$//'`

if [ $# == 0 ]; then
	device=en1
elif [ $# == 1 ]; then
	device="$1"
elif [ $# == 2 ]; then
	device="$1"
	mac="$2"
else
	echo "[device [MAC address]]"
	exit 1
fi

echo "Setting MAC address of ${device} to ${mac}"
networksetup -setairportpower "${device}" on || exit 1
/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -z || exit 1
/sbin/ifconfig "${device}" ether "${mac}" || exit 1
networksetup -detectnewhardware || exit 1
