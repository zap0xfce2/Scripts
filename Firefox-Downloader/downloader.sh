#/bin/sh
#
# Software Grabber by TheG33k 2012
# Product: Firefox
#

Software="Firefox"
TargetPath="/home/daten/Software"

# Get the downloadlinks
lynx --dump http://www.mozilla.org/en-US/firefox/all/index.php | awk '/(https):\/\// {print $2}' | grep download | grep lang=en-US > links.txt
# Chose german as language
perl -pi -e 's/lang=en-US/lang=de/g' links.txt

  if [ -f links.txt ]
   then
   wget -i links.txt 
  
   if [ -f *os=win* ]
    then
    mv *os=win* $TargetPath/Windows/$Software/$Software-Windows.exe 
   fi
    
   if [ -f *os=osx* ]
    then
    mv *os=osx* $TargetPath/Macintosh/$Software/$Software-Mac.dmg 
   fi
 
   if [ -f *os=linux* ]
    then
    mv *os=linux* $TargetPath/Linux/$Software/$Software-Linux.tar.bz2 
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
