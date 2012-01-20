# zeile für windows & zeile für Mac & entfernen der Temporären daten

./openoffice-linkgrabber.pl > OpenOffice-AllLinks.txt && cat OpenOffice-AllLinks.txt |grep download | grep exe| grep install-wJRE_de > OpenOffice-links.txt && wget -i OpenOffice-links.txt && mv *install-wJRE_de* /home/daten/Software/Windows/OpenOffice/OpenOffice-Windows.exe && ./openoffice-linkgrabber.pl > OpenOffice-AllLinks.txt && cat OpenOffice-AllLinks.txt | grep download | grep de.dmg | grep x86 > OpenOffice-links.txt && wget -i OpenOffice-links.txt && mv *de.dmg* /home/daten/Software/Macintosh/OpenOffice/OpenOffice-Mac.dmg && rm -R OpenOffice-AllLinks.txt && rm -R OpenOffice-links.txt

# zeile für linux
# ausgelassen weil zu viele distibutionen
#./openoffice-linkgrabber.pl > OpenOffice-AllLinks.txt && cat OpenOffice-AllLinks.txt | grep download | grep Linux
