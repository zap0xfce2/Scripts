#!/bin/bash




 if [ -n "$3" ]
  then
  
   if [ "$3" = "normal" ]
    then
     format='0'
   fi 

   if [ "$3" = "fett" ]
    then
     format='1'
   fi 

   if [ "$3" = "unterstrichen" ]
    then
     format='4'
   fi 

   if [ "$3" = "blinkend" ]
    then
     format='5'
   fi 

   if [ "$3" = "invertiert" ]
    then
     format='7'
   fi
  
  else
   format='0'
 fi 

 
 if [ -n "$2" ]
  then
 
   if [ "$2" = "gelb" ]
    then
     farbe='\033['$format';33m'
   fi 

   if [ "$2" = "rot" ]
    then
     farbe='\033['$format';31m'
   fi 

   if [ "$2" = "blau" ]
    then
     farbe='\033['$format';34m'
   fi

   if [ "$2" = "magenta" ]
    then
     farbe='\033['$format';35m'
   fi

   if [ "$2" = "cyan" ]
    then
     farbe='\033['$format';36m'
   fi 

   if [ "$2" = "grün" ]
    then
     farbe='\033['$format';32m'
   fi

  else
   farbe='\033['$format';0m'
 fi

  if [ -n "$1" ]
  then
   echo -e $farbe "$1" '\033[0m'
  else echo 'usage: printc text_string [color] [format]'
  fi



