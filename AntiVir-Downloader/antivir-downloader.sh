# zeile für windows & entfernen der Temporären daten

./antivir-linkgrabber.pl > AntiVir-AllLinks.txt && cat AntiVir-AllLinks.txt | grep de.exe > AntiVir-links.txt && wget -i AntiVir-links.txt && mv *de.exe* /home/daten/Software/Windows/AntiVir/AntiVir-Windows.exe && rm -R AntiVir-AllLinks.txt && rm -R AntiVir-links.txt
