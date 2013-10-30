#! /bin/sh 

#
# einzutragen mit crontab -e 
# 25 23 * * * /root/Sicherung.sh
#

##########################
## Konfiguration Anfang ##
##########################

# Welches Verzeichnis soll gesichert werden?
quelle=/daten

# Welches Medium soll gemountet werden?
externehdd=/dev/sdx1

# Mailadresse des Admins
adminmail=sender@youdomain.com

# Sendermailadresse
sendermail=absender@yourdomain.com

# Mail nach erfolgreichen sichern senden?
sendonokay=false

# Mail bei Fehlern Senden?
sendonfail=true

# bei lokaler sicherung leer lassen
mountparameter=""

# Soll das Medium am ende ausgeworfen werden?
unmountonend=true

# Format des Datums
tag=$(date +"%Y_%m_%d")

# wohin mounten/kopieren
# (verzeichnis wird angelegt wenn nicht vorhanden)
ziel=/media/sicherung

##########################
### Konfiguration Ende ###
##########################



### script anfang ###

# Versuche das Ziel zu erzeugen
mkdir -p $ziel

# Mounte die Festplatte nach Ziel
/bin/mount $mountparameter $externehdd $ziel

# Wenn der Mountvorgang erfolgreich ist
if [ "cat /proc/mounts | grep $ziel" ]
then
   # Schreibe das Datum in die Logdatei (am Anfang)
   /bin/date > /var/log/$tag-sicherung.log
   # Kopiere und schreibe das Ergebnis in die Logdatei
   #/bin/cp -uRv $quelle/* $ziel >> /var/log/$tag-sicherung.log
   /usr/bin/rsync -av --delete $quelle $ziel >> /var/log/$tag-sicherung.log
   # Schreibe das Datum in die Logdatei (am Ende)
   /bin/date >> /var/log/$tag-sicherung.log
   if $sendonokay; 
    then
    # Sende die Erfolgsmail
    /bin/date | /usr/bin/mail -s "Starte die Sicherung des Servers: " $(hostname) -r $sendermail $adminmail
   fi
# Wenn der Mountvorgang fehlgeschlagen ist
else
   # Schreibe den Fehler in die Logdatei
   echo "Fehler beim Mounten :-(" >> /var/log/$tag-sicherung.log
    if $sendonfail;
     then
     # Sende die Fehlermail
     /bin/date | /usr/bin/mail -s "Fehler beim Mounten auf Server: " $(hostname) -r $sendermail $adminmail
    fi
fi

if $unmountonend; 
 then
 # Unmounte das Ziel
 /bin/umount $ziel
fi

### script ende

