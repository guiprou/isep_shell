#!/bin/bash

# keep the results in a .txt file
exec >resultatflux.txt

# just pu in a variable to have the clearest code
url_flux="http://www.sport.fr/RSS/sport1.xml"


echo "-- Résultats du flux --"

#curl to access to html code then grep to find "<title>" and finally sed to substitue and execute some commands in a file (-e)
curl -s $url_flux | grep "<title>" | sed -e 's/<\/title>//g' -e 's/<title>//g' 
echo "-------------------------------"
curl -s $url_flux | grep "<description>" | sed -e 's/<\/description>//g' -e 's/<description>//g' 
echo

