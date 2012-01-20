#!/bin/bash

# Aufrufmöglichkeit auf der Shell
# for i in `seq 1 10`; do ./ComicGrabber.sh; sleep 1; done

# Ich speichere die letzte Aufrufnummer am Ende des Skripts
counter=$(tail -1 "$0");
# Mein default user agent für wget
user_agent="Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Ubuntu/10.10 Chromium/10.0.648.133 Chrome/10.0.648.133 Safari/534.16";

# Verzeichnis mit Datum anlegen
mkdir -p `date '+%d-%m-%Y'`;

# Pfad zum Bild festlegen
img_path=$PWD/`date '+%d-%m-%Y'`/"$counter.jpg";

# Das Bild runterladen
wget -q -U "$user_agent" -O $img_path "http://www.nichtlustig.de/comics/full/$counter.jpg";

# counter erhöhen 
counter=$[$counter+1];

# neuen Coutner im Skript setzen
tmp_filename=$(tempfile);
(head -n -2 "$0"; echo; echo $counter) > $tmp_filename;
cat $tmp_filename > "$0";
rm $tmp_filename;

# Prüfe ob das Bild gültig ist (größer als 10kb)
# falls nicht starte das Script neu
scriptpath=$PWD/$(basename $0);
cmp=$(du $img_path | awk '{print $1}');

if [ $cmp -lt 10 ]; then
 rm $img_path;
 exec $scriptpath;
else
 # Erfolgsmeldung ausgeben
 echo "Das Bild wurde erfolgreich heruntergeladen nach:"
 echo $img_path;
fi

# Script verlassen
exit 0;

#Counter

110111
