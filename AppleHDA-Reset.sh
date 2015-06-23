#!/bin/sh

kextunload /System/Library/Extensions/AppleHDA.kext
kextload /System/Library/Extensions/AppleHDA.kext
killall coreaudiod

# install SwitchAudioSource with
# brew install switchaudio-osx

sleep 1
SwitchAudioSource -s "Soundflower (2ch)"
sleep 1
SwitchAudioSource -s "Built-in Output"