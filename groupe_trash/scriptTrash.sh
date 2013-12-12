#!bin/bash
trashPath="~/.local/share/Trash/"


cd ~/.local/share/Trash/

if [ -L $trashPath ]; then
    echo "$trashPath exists"
else
    echo "$trashPath doesn t exist"
fi

exit
