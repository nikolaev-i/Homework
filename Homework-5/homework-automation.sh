#!/bin/bash

#Never spend 10 minutes on a task that you can automate in 2 hours 
# ~Ancient chinese proverb~

#Some input magic 

names=()
for n in {1..3};
do
	read -p "Enter a friend name $n:" name
	names+=("$name")
done
#-----creating and adding contents to file-----
echo -e "${names[0]}\n${names[1]}\n${names[2]}" >> friends.txt 
echo
echo "-----contents of friends.txt------"
head friends.txt

#Moving a file to rename it, linux can be weird
mv friends.txt bestfriends.txt

#"-----Copy and rename file-----"
cp bestfriends.txt sysadmins.txt

#Regexes are a pain, basic idea is to match a pattern something that starts with b and end in .txt 
echo
echo "-----get file name -----"
ls | grep '^b.*\.txt$'
echo
echo "----check file size-----"
du -h sysadmins.txt
echo
#Repeat for cars
cars=()
for n in {1..5};
do
	read -p"Enter car brand name $n:" cars
	cars+=("$name")
done
echo "-----creating and adding contents to file-----"
echo e- "${cars[0]}\n${cars[1]}\n${cars[2]}\n${cars[3]}\n${cars[4]}" >> cars.txt

echo "-----file size-----"
du -h cars.txt

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



