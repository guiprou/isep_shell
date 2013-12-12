#!/bin/bash

rm -rf /equipe_sh
cd / && mkdir /equipe_sh && cd /equipe_sh

wget --quiet --output-document page http://www.lequipe.fr/Football/

nbligne=$(cat /equipe_sh/page |wc -l)

echo -n "Téléchargement de la page http://www.lequipe.fr/Football... "

if [[ $nbligne != 0 ]]
	then sleep 1 ; echo "Terminé"
else
	sleep 1 ; echo "Echec"
fi

grep ".*\/Actualites\/.*" page |grep -o '<a .*href=.*>' >> liste_liens
sed -e "s/<[^>]*>//gw" liste_liens
