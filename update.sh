#!/bin/bash

echo "Which package manager do you want to Update: (Flathub f, Dnf d, Apt a, Both bfd (f and d), Both bfa (f and a))"

read update

if [ $update == "f" ]; then
        flatpak update
elif [ $update == "d" ]; then
    	sudo dnf update
elif [ $update == "a" ]; then
        sudo apt update
elif [ $update == "bfd" ]; then    
    sudo dnf update; flatpak update;
elif [ $update == "bfa" ]; then    
    sudo apt update; flatpak update;
fi
