#!/bin/bash

#Never spend 10 minutes on a task that you can automate in 2 hours 
# ~Ancient chinese proverb~

#Some input magic 

GREEN="\033[0;32m"
RED="\033[0;31m"
WHITE="\033[0;37m"
RESET="\033[0m"
CYAN="\033[;36m"
RESET="\033[0m"
BOLD="\033[1m"
YELLOW="\033[38;5;11m"

names=()
for n in {1..3};
do
	read -p "$(echo -e ${YELLOW}Enter a friend name $n:${RESET})" name
	names+=("$name")
done

#-----creating and adding contents to file-----
echo -e "${GREEN}${names[0]}\n${names[1]}\n${names[2]}${RESET}" >> friends.txt 
echo  $(echo -e "${RED}echo${RESET} ${GREEN}${names[0]}\n${names[1]}\n${names[2]} >> friends.txt${RESET}") 
#TODO figure out how to print the \n
read -p "$(echo -e $CYAN"Press enter to continue..."$RESET)"  

echo  $(echo -e "${RED}head${RESET} ${GREEN}friends.txt$RESET")
head friends.txt
read -p "$(echo -e $CYAN"Press enter to continue..."$RESET)"

#Moving a file to rename it, linux can be weird
mv friends.txt bestfriends.txt
echo  $(echo -e "${RED}mv${RESET} ${GREEN}friends.txt bestfriends.txt$RESET")
read -p "$(echo -e $CYAN"Press enter to continue..."$RESET)"

echo  $(echo -e "${RED}cp${RESET} ${GREEN}bestfriends.txt sysadmins.txt$RESET")
cp bestfriends.txt sysadmins.txt
read -p "$(echo -e $CYAN"Press enter to continue..."$RESET)"

#Regexes are a pain, basic idea is to match a pattern something that starts with b and end in .txt 
echo  $(echo -e "${RED}ls | grep${RESET} ${GREEN}'^b*\.txt$'$RESET")
ls | grep '^b.*\.txt$'
read -p "$(echo -e $CYAN"Press enter to continue..."$RESET)"

echo  $(echo -e "${RED}wc -c${RESET} ${GREEN}systadmins.txt$RESET")
wc -c sysadmins.txt
read -p "$(echo -e $CYAN"Press enter to continue..."$RESET)"

#Repeat for cars
cars=()
for n in {1..5};
do
	read -p "$(echo -e ${YELLOW}Enter car brand name $n: ${RESET})" cars
	cars+=("$name")
done



echo -e "${cars[0]}\n${cars[1]}\n${cars[2]}\n${cars[3]}\n${cars[4]}" >> cars.txt
echo $(echo -e "$RED"echo"$RESET ${GREEN}${cars[0]}\n${cars[1]}\n${cars[2]}\n${cars[3]}\n${cars[4]} >> cars.txt${RESET}")


wc -c cars.txt

#"-----copy to temp-----"
cp cars.txt /tmp

echo "------check tmp if the file is there and is the same---"
ls /tmp | grep .txt
diff cars.txt /tmp/cars.txt --brief

#"-----rename file-----"
mv /tmp/cars.txt /tmp/vehicles.txt

echo "-----open in editor file------"
sleep 2s
vim /etc/passwd


#use argument "commit" to add, commit pull and push to remote
if [ $1 == "commit" ]; then

git add . 

git commit -m "adding homework-5"

git pull 

git push

fi



