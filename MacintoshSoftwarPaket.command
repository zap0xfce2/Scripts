#/bin/bash

echo Folgende Programme werden Installiert: 
echo Firefox, Thunderbird, LibreOffice mit Deutschem Sprachpaket

open /Pfad/zum/Programm/Firefox/Firefox-Mac.dmg
sleep 5
cp -R /Volumes/Firefox/Firefox.app /Applications/
sleep 1
diskutil eject /Volumes/Firefox/
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Firefox.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

open /Pfad/zum/Programm/Thunderbird/Thunderbird-Mac.dmg
sleep 5
cp -R /Volumes/Thunderbird/Thunderbird.app /Applications/
sleep 1
diskutil eject /Volumes/Thunderbird/
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Thunderbird.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

open /Pfad/zum/Programm/LibreOffice/LibreOffice-Mac.dmg
sleep 5
cp -R "/Volumes/LibreOffice/LibreOffice.app" /Applications/
sleep 1
diskutil eject "/Volumes/LibreOffice/"
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/LibreOffice.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

open /Pfad/zum/Programm/LibreOffice/LibreOffice-LangPack-DE.dmg
sleep 5
open "/Volumes/LibreOffice Language Pack/LibreOffice Language Pack.app"
sleep 1
#diskutil eject "/Volumes/LibreOffice Language Pack/"

killall Dock