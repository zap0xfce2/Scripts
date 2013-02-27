#/bin/sh

###                        ###
# XBMC config refresh script #
# created by TheG33k @ 2013  #
###                        ###

echo "Quitting XBMC ..."
touch /var/lock/xbmc.disabled
killall -9 xbmc.bin
echo "XBMC is not running anymore!"

echo ""
echo "You can now edit the XBMC config files ..."
echo "Press RETURN if you are done with editing."
read

echo "Starting XBMC ..."
rm /var/lock/xbmc.disabled
