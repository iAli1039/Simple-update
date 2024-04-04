#!/bin/bash
i="0"

cat << "EOF"
     _    _ _   ____            _                         
    / \  | (_) |  _ \ __ _  ___| | ____ _  __ _  ___  ___ 
   / _ \ | | | | |_) / _` |/ __| |/ / _` |/ _` |/ _ \/ __|
  / ___ \| | | |  __/ (_| | (__|   < (_| | (_| |  __/\__ \
 /_/   \_\_|_| |_|   \__,_|\___|_|\_\__,_|\__, |\___||___/
        __  __                            |___/           
       |  \/  | __ _ _ __   __ _  __ _  ___ _ __          
       | |\/| |/ _` | '_ \ / _` |/ _` |/ _ \ '__|         
       | |  | | (_| | | | | (_| | (_| |  __/ |            
       |_|  |_|\__,_|_| |_|\__,_|\__, |\___|_|            
                                 |___/                        
EOF
# echo "Hellooooooo olloooloo"

while [ $i -lt 1 ]
do
echo "-------"
echo " "
echo "Packages to update: (Flatpak packages f, System Packages s, Both b) or q for quit"
read -p "Choose> " update

DISTRO_UPDATE_COMMAND=""
FOUND_DISTRO=$(uname -a | awk '{print $2}')

if [ "$FOUND_DISTRO" == "fedora" ]
then
	DISTRO_UPDATE_COMMAND="sudo dnf update"
elif [ "$FOUND_DISTRO" == "ubuntu" ]
then
	DISTRO_UPDATE_COMMAND="sudo apt update"
else
	echo "Distro is not supported yet, currently we only support fedora and ubuntu"
	exit

fi


if [ "$update" == "f" ]; 
then
	echo "Updating Flatpak packages ..."
        flatpak update
	i=1
elif [ "$update" == "s" ]; 
then
	echo "Updating system packages ..."
	$DISTRO_UPDATE_COMMAND
	i=1
elif [ "$update" == "b" ]; 
then
	echo "Updating both ..."
   	$DISTRO_UPDATE_COMMAND; flatpak update
	i=1
elif [ "$update" == "q" ];
then
	echo "Quitting app now !"
	i=1
else
	echo "Please, read the instructions, and enter a letter of the provided list next time, don't act stupid"

fi
done
