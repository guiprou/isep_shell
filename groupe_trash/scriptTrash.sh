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
	fi
fi

exit
