#!/bin/sh
#We need to test if the config file is a default Steam Proton or something else.

#Read the version file and save it as a variable
echo "Getting Proton Version of Talespire."
TSVERSION=$(cat ~/.steam/steam/steamapps/compatdata/720620/version)
if [[ $TSVERSION == *"Proton"* ]];
# Exit early if the version file contains proton. We're done.
break
else
#Add the word Proton to the variable because Valve loves spaces.
TSVERSION="Proton $TSVERSION"
fi

echo "Creating the MIME file."
echo "Thanks to Doskious and Adriannom on Discord!"
#Create the base configuration file, We'll add the Exec path later
echo "[Desktop Entry]
Type=Application
Name=TaleSpire
StartupNotify=false
MimeType=x-scheme-handler/talespire;" | tee ~/.local/applications/xdg-talespire.desktop;


echo "Exec=/bin/bash -c 'env WINEPREFIX=\"/home/$USER/.steam/steam/steamapps/compatdata/720620/pfx\" WINEESYNC=1 /home/$USER/.steam/steam/steamapps/common/$TSVERSION/dist/bin/wine64 /home/$USER/.steam/steam/steamapps/common/TaleSpire/TaleSpireUrlRelay.exe %u'" >> ~/.local/applications/xdg-talespire.desktop

echo "Adding the MIME type."
xdg-mime default xdg-talespire.desktop x-scheme-handler/talespire

echo "And we're done! Test if everything is setup correctly with 'xdg-open talespire://dice/TEST:1d20'"
echo "This will roll a d20 labeled TEST in Talespire if everything is setup properly"
#Clean up after ourselves!
rm "tsxdg-setup.sh"
exit 0