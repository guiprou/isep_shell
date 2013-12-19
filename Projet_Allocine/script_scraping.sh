#!/bin/bash
 

curl -s http://www.allocine.fr/film/aucinema/ | Sed -n '/<a class=\"no_underline\".*/,/<\/a>/p'| sed 's/<[^>]*>//g'

curl -s http://www.allocine.fr/film/aucinema/ | Sed -n '/<p class=\"margin_5t\".*/,/<\/p>/p' | sed 's/<[^>]*>//g'
