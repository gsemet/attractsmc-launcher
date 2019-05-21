#!/bin/bash
cd /home/osmc

# This scripts starts the attract watchdog deamon and
# attract itself while stopping KODI afterwards.
# Script by mcobit

#clear the virtaul terminal 7 screen

sudo openvt -c 7 -s -f clear

# start the watchdog script

sudo su osmc -c "sh /home/osmc/RetroPie/scripts/retropie_watchdog.sh &" &

# check if attract script in chroot is changed and if so, create altered script

sudo chown osmc:osmc /usr/bin/attract

echo '#!/bin/bash
es_bin="/opt/retropie/supplementary/attractmode/bin/attract"
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/sbin:/usr/sbin:/usr/osmc/bin:/opt/vc/bin

if [[ $(id -u) -eq 0 ]]; then
    echo "attract should not be run as root. If you used 'sudo attract' please run without sudo."
    exit 1
fi
if [[ -n "$(pidof X)" ]]; then
    echo "X is running. Please shut down X in order to mitigate problems with loosing keyboard input. For example, logout from LXDE."
    exit 1
fi
$es_bin "$@"' > "/usr/bin/attract"

# start attract on vitrual terminal 7 and detach it

sudo su osmc -c "nohup openvt -c 7 -f -s attract >/dev/null 2>&1 &" &

# clear the screen again

sudo openvt -c 7 -s -f clear

# wait a bit to make sure attract is running detached from kodi

sleep 0.5

# stop kodi to free input devices for attract

sudo su -c "systemctl stop mediacenter &" &

exit
