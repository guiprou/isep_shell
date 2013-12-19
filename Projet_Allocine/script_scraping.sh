#!/bin/bash
 
<<<<<<< HEAD
curl -s http://www.allocine.fr/film/aucinema/ | sed -n '/<a class=\"no_underline\".*/,/<\/a>/p'| sed 's/<[^>]*>//g'curl
=======
curl -s http://www.allocine.fr/film/aucinema/ grep 'div'

curl -s http://www.allocine.fr/film/aucinema/ | Sed -n '/<a class=\"no_underline\".*/,/<\/a>/p'| sed 's/<[^>]*>//g'
>>>>>>> 95cbac4c5186232bb4c8b9305b653edf935e7c4b
