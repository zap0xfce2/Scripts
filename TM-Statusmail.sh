#!/bin/sh
#
# setup postfix in osx:
# http://benjaminrojas.net/configuring-postfix-to-send-mail-from-mac-os-x-mountain-lion/
# fix forlders
# https://discussions.apple.com/thread/3212853?start=0&tstart=0
#
# Wichtig: Da das system.log täglich neu angelegt wird, sollte das Skript an dem Tag ausgeführt werden, an dem auch die Sicherungen kontrolliert werden sollen.
#
# einzutragen mit crontab -e
# 30 10 1 * * /root/TM-Statusmail.sh
#

##########################
## Konfiguration Anfang ##
##########################

#Empfänger
#mehrere können mit leerzeichen getrennt werden
MailTo="mailto@some-server.de"

#Sender
MailFrom="mailfrom@some-server.de"
MailFromName="TimeMachine Daemon"

#Betreff
MailSubject="TimeMachine Status"

# Wie viele Zeilen
LogLines=15

##########################
### Konfiguration Ende ###
##########################

grep backupd /var/log/system.log | sed s_/System/Library/CoreServices/__g | tail -n $LogLines | mail -s "$(echo "$MailSubject\nFrom: $MailFromName <$MailFrom>\nContent-Type: text/plain\n")" $MailTo
