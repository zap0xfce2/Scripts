# zeile für windows & entfernen der Temporären daten

./nod32-linkgrabber.pl > Nod32-AllLinks.txt && cat Nod32-AllLinks.txt | grep -m1 eav_nt32_deu > Nod32-links.txt && wget -i Nod32-links.txt && mv *eav_nt32_deu* /home/daten/Software/Windows/Nod32/Nod32-32Bit.exe && ./nod32-linkgrabber.pl > Nod32-AllLinks.txt && cat Nod32-AllLinks.txt | grep -m1 eav_nt64_deu > Nod32-links.txt && wget -i Nod32-links.txt && mv *eav_nt64_deu* /home/daten/Software/Windows/Nod32/Nod32-64Bit.exe && rm -R Nod32-AllLinks.txt && rm -R Nod32-links.txt
