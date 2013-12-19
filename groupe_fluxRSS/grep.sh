curl "http://www.sport.fr/RSS/sport1.xml" | grep -E '(item>|title>|description>)' | \
'/<title>/,/<\/title>/' |  sed "s/<title>//g" | sed "s/<\/title>/\n/g" | sed 's/^[ \t]*//' > simple.txt 
'/<description>/,/<\/description>/' |  sed "s/<description>//g" | sed "s/<\/description>/\n/g" | sed 's/^[ \t]*//' >> simple.txt 
