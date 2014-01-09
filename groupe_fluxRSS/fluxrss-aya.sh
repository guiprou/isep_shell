#!/bin/bash

exec >resultatflux.txt
url_flux="http://www.sport.fr/RSS/sport1.xml"

echo "-- Résultats du flux --"
curl -s $url_flux | grep "<title>" | sed -e 's/<\/title>//g' -e 's/<title>//g' 
echo "-------------------------------"
curl -s $url_flux | grep "<description>" | sed -e 's/<\/description>//g' -e 's/<description>//g' 
echo