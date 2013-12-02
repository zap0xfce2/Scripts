#!/bin/sh
#
# installation unter OSX mit:
# brew install sendemail
# oder binary downloaden von
# http://caspian.dotconf.net/menu/Software/SendEmail/
#
# einzutragen mit crontab -e
# 30 10 1 * * /root/TM-Statusmail.sh
#

##########################
## Konfiguration Anfang ##
##########################

#Empfänger
MailTo="mailto@some-server.de"

#Sender
MailFrom="mailfrom@some-server.de"

#Betreff
MailSubject="TimeMachine Status"

#Mailserver
MailSMTP="smtp.some-server.de:25"
MailSMTPUser="mailfrom@some-server.de"
MailSMTPPass="my_smtp_password"

# Wie viele Zeilen
LogLines=15

##########################
### Konfiguration Ende ###
##########################

grep backupd /var/log/system.log | sed s_/System/Library/CoreServices/__g | tail -n $LogLines | sendEmail -q -f $MailFrom -o tls=no -t $MailTo -u $MailSubject -s $MailSMTP -xu $MailSMTPUser -xp $MailSMTPPass
