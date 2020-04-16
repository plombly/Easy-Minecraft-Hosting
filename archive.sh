#!/bin/bash

	##Written by Plombly#5139,

	##CEO of Nodecade.IT

	##Message me on Discord for and questions you may have.

	##Please make changes at your own will, and branch them to support others!

##File Directory variables

archive=/home/_arch/
dir1=$1
dir2="${dir1%/*}"
dirname=${dir2##*/}
d=$(date +'%d%m%Y')
zip=${dirname}${d}


	##The beginning, Dun Dun DUN!!!

		echo "$(tput setaf 0)$(tput setab 7)You are about to archive a directory!$(tput sgr 0)"
		sleep 3s

	##Checks to see for input

	if [ "$1" != "" ]; then

		sleep 1s

	else
		echo "No input, exiting"
		exit 1
	fi

	##Checking to see if the folder exists

	if [ -d "$1" ]; then

		echo "file $1 found"
		sleep 1s
		cd $dir1

	else

		echo "file $1 not found, please try again"
		exit 1

	fi

	##Verification

		read -p "$(tput setaf 0)$(tput setab 7)Is $dir1 correct?$(tput sgr 0)(Y or N)" yn

	if [ "$yn" != "${yn#[Yy]}" ] ;then

		sleep 1s

        ##Archive zipping process

	        zip -r ${zip}.zip *

        ##Moving zip to archive

        mv ${zip}.zip $archive${zip}.zip

	##If they answered no on the verification step

	else

		echo "please try again"

	fi
