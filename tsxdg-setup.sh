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

#Get the Path for Talespire from the libraryfolders.vdf CHAIRMANDER POG!
TSLIB=$(cat ~/.steam/steam/steamapps/libraryfolders.vdf | grep -Pzo "\"path\"\s*\"(.*)\"[^{]*\{[^}]*\"720620\"" | grep -Pao "/[^\"]*")

#Give the user the chance to verify the installation location, continue this throughout the script.
echo "TaleSpire appears to be installed at $TSLIB if this is wrong please quit now. (Use Control+C)"
sleep 5

cd ~/.local/share/applications

#Read the version file and save it as a variable
echo "Getting Proton Version of Talespire."
TSVERSION=$(cat $TSLIB/steamapps/compatdata/720620/version)
if [[ $TSVERSION == *"Proton"* ]]; then
# Exit early if the version file contains a proton fork. We're done.
    echo "We found TaleSpire using $TSVERSION. If this isn't right quit now."
    echo ""
    # proton forks are generally installed into compat.d
    PROTONPATH=/home/$USER/.steam/steam/compatibilitytools.d/$TSVERSION/files/bin
    sleep 5
else
#Add the word Proton to the variable because Valve loves spaces.
    TSVERSION="Proton $TSVERSION"
    echo "We found TaleSpire using Vanilla $TSVERSION. If this isn't right quit now."
    #Assume Vanilla Proton is installed in the same Library Folder as TaleSpire.
    echo ""
    echo "Because you are using a Vanilla Proton version, we are assuming its in the same location as TaleSpire."
    echo "If this isn't correct, After the script finishes manually modify the path in ~/.local/share/applications/xdg-talespire.desktop"
    PROTONPATH=$TSLIB/steamapps/$TSVERSION/dist/bin
    sleep 5
fi
sleep 1
echo "Creating the MIME file."
echo "Thanks to Doskious, Adriannom and Chairmander on Discord!"
sleep 1
#Create the base configuration file, We'll add the Exec path later

cd ~/.local/share/applications

echo -n "[Desktop Entry]
Type=Application
Name=TaleSpire
StartupNotify=false
MimeType=x-scheme-handler/talespire
# If you are having issues, replace WINEESYNC=1 with WINEFSYNC=1
" | tee -a ~/.local/share/applications/xdg-talespire.desktop
echo "Exec=/bin/bash -c 'env WINEPREFIX=\"$TSLIB/steamapps/compatdata/720620/pfx\" WINEESYNC=1 $PROTONPATH/wine64 $TSLIB/steamapps/common/TaleSpire/TaleSpireUrlRelay.exe %u';" | tee -a ~/.local/share/applications/xdg-talespire.desktop
sleep 1

echo ""
echo ""
echo "Adding the MIME type."
xdg-mime default xdg-talespire.desktop x-scheme-handler/talespire

sleep 1
echo "And we're done! Test if everything is setup correctly with 'xdg-open talespire://dice/TEST:1d20'"
echo "This will roll a d20 labeled TEST in Talespire if everything is setup properly"
#Clean up after ourselves!
cd $WHEREAMI
#rm "tsxdg-setup.sh"
exit 0