
# SpoofAirportMAC

A launchd script for OS X that randomises the airport MAC address.

Based on:  
http://erratasec.blogspot.co.uk/2013/01/i-conceal-my-identity-same-way-aaron.html  
https://github.com/feross/SpoofMAC

By @dekstop 2013-01-16

## Installation

The launchd file structure makes the installation process a bit tedious.

```bash
git clone https://github.com/dekstop/SpoofAirportMAC.git .
```

Open de.dekstop.SpoofAirportMAC.plist in a text editor and update the script path.
Optionally change the device name (e.g. to en0 for a Macbook Air.)

And then as root:
```bash
cp de.dekstop.SpoofAirportMAC.plist /Library/LaunchDaemons/
chown root:wheel /Library/LaunchDaemons/de.dekstop.SpoofAirportMAC.plist
chmod 0755 /Library/LaunchDaemons/de.dekstop.SpoofAirportMAC.plist
launchctl load /Library/LaunchDaemons/de.dekstop.SpoofAirportMAC.plist
```

## Execution

The script will automatically execute at boot time.

To execute it manually:
```bash
sudo launchctl start de.dekstop.SpoofAirportMAC
```

Output is logged in /var/log/system.log
