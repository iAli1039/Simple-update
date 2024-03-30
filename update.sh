#!/bin/bash

echo "Which package manager do you want to Update: (Flathub f, Dnf d, Apt a, Both b)"

read update

if [ $update == "f" ]; then
        flatpak update
elif [ $update == "d" ]; then
    	sudo dnf update
elif [ $update == "a" ]; then
        sudo apt update
else    
    sudo dnf update; flatpak update
fi
