#!/bin/bash

echo "you to make update of course? (Flathub f, Dnf d, Both b)"

read update

if [ $update == "f" ]; then
        flatpak update
elif [ $update == "d" ]; then
    	sudo dnf update

else    
    sudo dnf update; flatpak update

fi
