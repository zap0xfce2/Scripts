#/bin/sh
#
# Software Grabber by TheG33k 2012
# Product: Firefox
#

Software="Spybot"
TargetPath="/home/daten/Software"

# Get the downloadlinks
./linkgrabber.pl "http://spybot-download.net/" | grep exe > links.txt 

  if [ -f links.txt ]
   then
   wget -i links.txt 
  
   if [ -f *.exe* ]
    then
    mv *.exe* $TargetPath/Windows/$Software/$Software-Windows.exe 
   fi
 
  fi
  
# clenup the links 
if [ -f links.txt ]
 then
 rm links.txt
fi

# clenup the index*
if [ -f index.html* ]
 then
 rm index.html* 
fi
