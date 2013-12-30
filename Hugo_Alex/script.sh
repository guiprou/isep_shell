#!/bin/bash
# Auteurs : Hugo BOUTINON & Alexandre PAPP

# On efface le dossier et les fichiers contenus
rm -rf /equipe_sh
# On créé un dossier à la racine et on se place dedans
mkdir /equipe_sh && cd /equipe_sh

# On affiche la bannière
cat <<"BANNER"                                                                                                              
         _\|/_
         (o o)
 +----oOO-{_}-OOo------------------------------+
  _                   _                 __      
 | | ___  __ _  _  _ (_) _ __  ___     / _| _ _ 
 | |/ -_)/ _` || || || || '_ \/ -_) _ |  _|| '_|
 |_|\___|\__, | \_,_||_|| .__/\___|(_)|_|  |_|  
            |_|         |_|                     
 |                                             |
 |                           By: Hugo & Alex   |
 +---------------------------------------------+

BANNER


function aide {
	echo -e "Ce script permet de récupérer les dernières actualités footballistiques sur le site de lequipe.fr \nUne recherche par mots clefs sera bientôt possible \n"
        echo -e "Utilisation : ./script.sh [-OPTS] [MOTS CLEFS] \n"
}

function affiche {
echo -n "Téléchargement de la page http://www.lequipe.fr/news.html... "

# On télécharge le code source qu'on enregistre dans un fichier page, sans afficher les opérations.
wget --quiet --output-document page http://www.lequipe.fr/news.html

# Substitution permettant de compter le nombre de lignes du fichier page
nbligne=$(cat /equipe_sh/page 2> /dev/null |wc -l)

# On vérifie que le fichier contient quelque chose (que la page a été correctement téléchargée)
if [[ $nbligne != 0 ]]
	then sleep 1 ; echo "Terminé"
else
	sleep 1 ; echo "Echec"
fi

# On ne prend que les liens liés aux actualités, on ne garde que ce qu'il y'a à l'intérieur de "href", on élimine les doublons, et on garde les actus foot.
# On redirige la sortie standard pour enregistrer les résultats dans "liste_cleans"
grep -o ".*\/Actualites\/.*" page |grep -o -E 'href="([^"#]+)"' |cut -d'"' -f2 |uniq |grep "Football" > liste_cleans

# On compte le nombre de liens présent dans "liste_cleans"
# Cela donne l'intervalle dans lequel générer le nombre aléatoire
max=$(wc -l < liste_cleans)
number=$[($RANDOM % ($max + 1))]

# Head -X affiche les X premières lignes du fichier, tail -1 affiche la dernière
# Solution réservée aux fichiers de petites tailles
lien="http://www.lequipe.fr"$(head -$number liste_cleans | tail -1)

echo -n "Téléchargement de la page $lien... "

wget --quiet --output-document article $lien

# Comme vu plus haut, on vérifie que la page a bien été téléchargée en comptant le nombre de lignes présentes.
nbligne=$(cat /equipe_sh/article 2> /dev/null |wc -l) 

if [[ $nbligne != 0 ]]
	then sleep 1 ; echo "Terminé"
else
	sleep 1 ; echo "Echec"
fi

# On conserve le contenu à l'intérieur de la balise <div paragr...></div>, on supprime les balises HTML, on supprime les tabulations, on résoud les problèmes d'encodage
# On redirige vers la poubelle la sortie 2 (qui affiche les erreurs)
grep "paragr paragraf.*" < article 2> /dev/null |sed 's|</b>||g' 2> /dev/null |sed 's|<[^>]*>||g' 2> /dev/null |sed -r "s/\t//ig" 2> /dev/null |sed "s/&rsquo;/\'/g" > contenu 2> /dev/null
echo 

# On affiche le contenu du fichier "contenu"
cat -n contenu 2> /dev/null
}

if [[ $# != 0 ]] ; then 
        if [[( $1 == '-h' || $1 == '--help' ) && $# == 1 ]] ; then
                aide
        elif [[ $# > 1 ]] ; then 
                shift
                for i
                do
                        mots=$mots" "$i
                done
        else echo -e "Option ou argument non reconnu\n"
        fi
else affiche
fi



