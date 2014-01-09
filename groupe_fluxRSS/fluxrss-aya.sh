#!/bin/bash

#keep the results in a .txt file
#exec >resultatflux.txt

# just put in a variable to have the clearest code
url_flux1="http://www.sport.fr/RSS/sport1.xml"
url_flux2="http://rss.leparisien.fr/leparisien/rss/une.xml"

echo "-- Résultats du flux choisi n°1--"
echo
curl -s  "$url_flux1" | grep -E "(title>|description>)" | sed -e 's/<title>//g' -e 's/<\/title>//g' -e 's/<description>/   /g' -e 's/<\/description>//g' 
echo
echo
echo "-- Résultats du flux choisi n°2--"
echo
curl -s  "$url_flux2" | grep -E "(title>|description>)" | sed -e 's/<title>//g' -e 's/<\/title>//g' -e 's/<description>/   /g' -e 's/<\/description>//g' 
echo


      
# send the content of a text file by mail :
#mail -s "Flux RSS Quotidiens" ayako.dumont@gmail.com < resultatflux.txt

# if just want to send a mail
#echo "message of mail" | mail -s "Object of the mail" ayako.dumont@gmail.com

#crontab -e
# execute fluxrss.sh everyday at 9:oo
#0 9 * * * fluxrss.sh