#/bin/bash

echo Folgende Programme werden Installiert: 
echo Firefox, Thunderbird, OpenOffice

open /Pfad/zum/Programm/Firefox/Firefox-Mac.dmg
sleep 3
cp -R /Volumes/Firefox/Firefox.app /Applications/
sleep 1
diskutil eject /Volumes/Firefox/

open /Pfad/zum/Programm/Thunderbird/Thunderbird-Mac.dmg
sleep 3
cp -R /Volumes/Thunderbird/Thunderbird.app /Applications/
sleep 1
diskutil eject /Volumes/Thunderbird/

open /Pfad/zum/Programm/OpenOffice/OpenOffice-Mac.dmg
sleep 3
cp -R "/Volumes/OpenOffice.org 3.3/OpenOffice.org.app" /Applications/
sleep 1
diskutil eject "/Volumes/OpenOffice.org 3.3/"