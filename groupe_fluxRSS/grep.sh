#!/bin/bash

url_flux="http://www.sport.fr/RSS/sport1.xml"


echo "--flux--"
curl -s $url_flux | grep "<title>" | sed -e 's/<\/title>//g' -e 's/<title>//g' 
echo
