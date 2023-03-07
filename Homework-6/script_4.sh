#4. Write a shell script that prompts the user for a name of a file or directory and reports if it is a regular  file, a  directory, or another  type  of  file.  Also  perform a ls command against the  file or directory with the long listing option.


#!/bin/bash

read -p "Please enter a name for a file or directory: " input

#check for valid name

if [ ! -e "$input" ]; then
	echo "n/a"
	exit 1
fi


if [ -d "$input" ]; then
	echo "$input is a directory"
elif [ -f "$input" ]; then
	echo "$input is a regular file"
else 
	echo "$input is another type"
	exit 1
fi

ls -l "$input"


