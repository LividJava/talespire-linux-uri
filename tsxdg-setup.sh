#!/bin/sh
WHEREAMI=$(pwd)

echo "Welcome to the UNOFFICIAL Talespire URI Install script!"
echo "Please note, this is a Community Script, and is NOT OFFICIALLY SUPPORTED!"
echo ""
echo "This script assumes that you are using DEFAULT install paths for Steam AND Talespire."
echo "If you are not, you MUST install manually!"
echo ""
sleep 5

#We need to test if the config file is a default Steam Proton or something else.

#Read the version file and save it as a variable
cd ~/.local/share/applications

echo "Getting Proton Version of Talespire."
TSVERSION=$(cat ~/.steam/steam/steamapps/compatdata/720620/version)
if [[ $TSVERSION == *"Proton"* ]]; then
# Exit early if the version file contains proton. We're done.
    echo "We found TaleSpire using $TSVERSION. If this isn't right quit now."
    sleep 5
else
#Add the word Proton to the variable because Valve loves spaces.
    TSVERSION="Proton $TSVERSION"
    echo "We found TaleSpire using Vanilla $TSVERSION. If this isn't right quit now."
    sleep 5
fi
sleep 1
echo "Creating the MIME file."
echo "Thanks to Doskious and Adriannom on Discord!"
#Create the base configuration file, We'll add the Exec path later
sleep 1

echo -n "[Desktop Entry]
Type=Application
Name=TaleSpire
StartupNotify=false
MimeType=x-scheme-handler/talespire
# If you are having issues, replace WINEESYNC=1 with WINEFSYNC=1
" | tee -a ~/.local/share/applications/xdg-talespire.desktop
echo "Exec=/bin/bash -c 'env WINEPREFIX=\"/home/$USER/.steam/steam/steamapps/compatdata/720620/pfx\" WINEESYNC=1 /home/$USER/.steam/steam/steamapps/common/$TSVERSION/dist/bin/wine64 /home/$USER/.steam/steam/steamapps/common/TaleSpire/TaleSpireUrlRelay.exe %u';" | tee -a ~/.local/share/applications/xdg-talespire.desktop
clear

sleep 1
echo "Adding the MIME type."
xdg-mime default xdg-talespire.desktop x-scheme-handler/talespire

sleep 1
echo "And we're done! Test if everything is setup correctly with 'xdg-open talespire://dice/TEST:1d20'"
echo "This will roll a d20 labeled TEST in Talespire if everything is setup properly"
#Clean up after ourselves!
cd $WHEREAMI
#rm "tsxdg-setup.sh"
exit 0