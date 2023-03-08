#5. Use arguments in a script.  Total number of arguments should be three.
#!bin/bash/


if [ $# -eq 3 ]
then
	echo $3
	echo $2
	echo $1
else 
 
	echo Please input excatly 3 arguments.
fi




