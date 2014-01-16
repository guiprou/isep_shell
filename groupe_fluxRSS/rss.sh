#wget -q -O - http://www.actualites-du-net.com/feed/ | sed -n 's#.*<item>\(.*\)</item>.*#\1#p' 

url="http://www.actualites-du-net.com/feed/"
curl -s $url | grep -e "<title>" | sed -e 's/<title>//g' -e 's/<\/title>//g'

echo "sans le premier titre"
curl -s $url | grep -e "<title>" | sed -e 's/<title>//g' -e 's/<\/title> //g' -e 's/<description>//g' -e 's/<\/description>//g'  | sed -e '1d'
