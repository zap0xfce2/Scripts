# zeile für windows & entfernen der Temporären daten

./spybot-linkgrabber.pl > spybot-AllLinks.txt && cat spybot-AllLinks.txt | grep exe > spybot-links.txt && wget -i spybot-links.txt && mv *.exe* /home/daten/Software/Windows/Spybot/Spybot-Windows.exe && rm -R spybot-AllLinks.txt && rm -R spybot-links.txt

# zeile für linux
# ausgelassen weil zu viele distibutionen
#./openoffice-linkgrabber.pl > OpenOffice-AllLinks.txt && cat OpenOffice-AllLinks.txt | grep download | grep Linux
