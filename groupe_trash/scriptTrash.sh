#!bin/bash

cd ~/.local/share/

if [ -d "Trash/" ]; then
	
	echo Directory Trash exists
	cd Trash/files/

	sizeMin=4
	sizeFiles=$(du -h | grep . | sort -n | tail -n 1 | cut -d K -f 1)
	
	
	if [ $sizeFiles = $sizeMin ]; then
		echo  Trash is empty
	else
		echo Trash contains some files
		
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
