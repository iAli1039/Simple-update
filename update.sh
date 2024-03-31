#!/bin/bash
i="0"

echo "Hellooooooo olloooloo"

while [ $i -lt 1 ]
do
echo "-------"
echo " "
echo "you to make update of course? (flathub y ,dnf n, Both b) or q for quit"

read -rsn1 update


if [ "$update" == "y" ]; 
then
	echo "Updating Flatpak ..."
        flatpak update
	i=1
elif [ "$update" == "n" ]; 
then
	echo "Updating DNF ..."
    	sudo dnf update
	i=1
elif [ "$update" == "b" ]; 
then
	echo "Updating both ..."
   	sudo dnf update; flatpak update
	i=1
elif [ "$update" == "q" ];
then
	echo "Quitting app now !"
	i=1
else
	echo "Please, read the instructions, and enter a letter of the provided list next time, don't act stupid"

fi
done
