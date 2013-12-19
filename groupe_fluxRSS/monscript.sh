awk '/<title>/,/<\/title>/' monFichier.xml |  sed "s/<title>//g" | sed "s/<\/title>/\n/g" | sed 's/^[ \t]*//' > simple.txt 
awk '/<description>/,/<\/description>/' monFichier.xml |  sed "s/<description>//g" | sed "s/<\/description>/\n/g" | sed 's/^[ \t]*//' >> simple.txt 
awk '/<contenu>/,/<\/contenu>/' monFichier.xml |  sed "s/<contenu>//g" | sed "s/<\/contenu>/\n/g" | sed 's/^[ \t]*//' >> simple.txt 
less simple.txt
