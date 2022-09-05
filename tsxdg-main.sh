#!/bin/sh

WHEREAMI=$(pwd)

echo "Welcome to the UNOFFICIAL Talespire URI Install script!"
echo "Please note, this is a Community Script, and is NOT OFFICIALLY SUPPORTED!"
echo ""
echo "This script assumes that you are using DEFAULT install paths for Steam AND Talespire."
echo "If you are not, you MUST install manually!"
echo ""

sleep 5

clear
echo "Testing to see if you have something configured already"

#Look for the common typo files if they exist at all.
if
    [ -f ~/.local/share/applications/talespire-xdg.desktop ] || [ -f ~/.local/share/applications/xdg-talespire.desktop ]
then
    echo "We can see a file! We'll try to use the existing file!"
    #it's jank but assign the existing file to a variable for use later.
    if
        [ -f ~/.local/share/applications/talespire-xdg.desktop ]
    then
        JANKFILE="~/.local/share/applications/talespire-xdg.desktop"
    else
        JANKFILE="~/.local/share/applications/xdg-talespire.desktop"
    fi
    #set a variable equal to whatever xdg-mime has
    TSXDG=$(xdg-mime query default x-scheme-handler/talespire)
    mv $JANKFILE $TSXDG
    echo ""
    echo "We've made the existing file match MIME, please test by running 'xdg-open talespire://dice/TEST:1d20'"
    echo "Talespire should open and roll a single D20 labeled TEST"
    clear
    exit 0
else
echo "We could not find an existing file! Let's get you set up!"
wget -N "https://raw.githubusercontent.com/LividJava/talespire-linux-uri/main/tsxdg-setup.sh" && bash tsxdg-setup.sh
echo ""
fi