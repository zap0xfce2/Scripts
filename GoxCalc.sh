#/bin/bash

# Volumen * Kurs = Umsatz
# Umsatz - Einsatz = Gewinn

# (Gewinn + Einsatz) / Volumen = Kurs

#echo '{"foo": "lorem", "bar": "ipsum"}' | ruby -e "require 'rubygems'; require 'json'; puts JSON[STDIN.read]['bar'];"
#jasonquery="/usr/local/Cellar/jq/1.3/bin/jq"
#Kurs=$(curl http://data.mtgox.com/api/2/BTCEUR/money/ticker_fast -s | $jasonquery -r '.data .last .value')

read -p "Welcher Modus? 1 = Gewinn | 2 = Kurs : " Modus
Modus=${Modus:=1}

if [ "$Modus" == "1" ]; 
then
 read -p "Gib die Menge an BitCoins ein: " Volumen
 Volumen=${Volumen:=1.5}
 read -p "Gib deinen Einsatz ein: " Einsatz
 Einsatz=${Einsatz:=1500}

 Kurs=$(curl http://data.mtgox.com/api/2/BTCEUR/money/ticker_fast -s | ruby -e "require 'rubygems'; require 'json'; puts JSON[STDIN.read]['data']['last']['value'];")
 Gewinn=$(bc <<< "($Volumen*$Kurs)-$Einsatz")

 echo "Dein Gewinn beträgt: $(echo $Gewinn | sed s/\\./,/g | awk '{printf("%.2f",$1)}') €"
 echo "Aktueller Kurs: $(echo $Kurs | sed s/\\./,/g | awk '{printf("%.2f",$1)}') €"
fi


if [ "$Modus" == "2" ]; 
then
 read -p "Gib deinen gewünschten Gewinn ein: " GewinnReverse
 GewinnReverse=${GewinnReverse:=1000}

 read -p "Gib deinen Einsatz ein: " EinsatzReverse
 EinsatzReverse=${EinsatzReverse:=1500}

 read -p "Gib die Menge an BitCoins ein: " VolumenReverse
 VolumenReverse=${VolumenReverse:=1.5}

 Kurs=$(bc <<< "($GewinnReverse+$EinsatzReverse)/$VolumenReverse")

 echo "Berechneter Kurs für den Gewinn von $(echo $GewinnReverse | sed s/\\./,/g | awk '{printf("%.2f\n",$1)}') € wäre: $(echo $Kurs | sed s/\\./,/g | awk '{printf("%.2f\n",$1)}') €"
fi
