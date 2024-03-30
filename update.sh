#!/bin/bash

echo "you to make update of course? (flathub y ,dnf n, Both b)"

read update

if [ $update == "y" ]; then
        flatpak update
elif [ $update == "n" ]; then
    	sudo dnf update

else    
    sudo dnf update; flatpak update

fi
