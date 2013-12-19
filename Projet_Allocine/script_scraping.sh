#!/bin/bash
 
curl -s http://www.allocine.fr/film/aucinema/ grep 'div'

curl -s http://www.allocine.fr/film/aucinema/ | Sed -n '/<a class=\"no_underline\".*/,/<\/a>/p'| sed 's/<[^>]*>//g'
