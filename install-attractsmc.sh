#!/bin/sh

cp -v attractsmc.sh $HOME/RetroPie/scripts/
chmod +x $HOME/RetroPie/scripts/attractsmc.sh

sudo rm -f /home/osmc/.kodi/addons/plugin.program.attracsmc-launcher
sudo cp -fv plugin.program.attracsmc-launcher /home/osmc/.kodi/addons/
