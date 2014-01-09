#!bin/bash

#On se place dans le dossier sensé contenir la corbeille: Trash
cd ~/.local/share/

#Condition sur l'existence du répertoire Trash(-d pour directory)
if [ -d "Trash/" ]; then
	
	#Si la corbeille existe, on se déplace dans le sous-dossier files contenant les éléments à supprimer
	echo Directory Trash exists
	cd Trash/files/

	#La taille minimale du sous-dossier files est de 4ko
	sizeMin=4

	#La commande suivante permet d'obtenir la taille du sous-dossier files
	sizeFiles=$(du -h | grep . | sort -n | tail -n 1 | cut -d K -f 1)
	
	#Le dossier files pese 4ko, la corbeille est vide
	if [ $sizeFiles = $sizeMin ]; then
		echo  Trash is empty
	#Le dossier files est différent de 4ko, il contient des éléments
	else
		echo Trash contains some files
		
		#On vérifie que tous les arguments nécessaires à la suppression 
		#sélective sont indiqués par l'utilisateur
		#$1: pl(plus) ou mi(minus); $2: taille; $3: unité (ko, mo)
		if [ $1 && $2 && $3 ]; then
			case $1 in
			pl) var=$(find . -size + $2 $3 -exec rm -i);;
			mi) varis=$(find . -size - $2 $3 -exec rm -i);;
			
			
			
		else		
			echo No Parameter			
		fi
	fi
fi

exit
