#! /bin/bash

create=$1
name=$2
number=$3
dir=dir.txt

if [ ! -e $dir ]; then
	touch dir.txt
fi

if [ "$create" = new ]
then
	echo "inserting $name $number"
	echo "$name $number" >> $dir
elif [ "$create" = list ]
then
	#check if list is empty
	size=$(stat -c%s $dir)


	if [ $size = 0 ]
	then 
		echo "Phonebook is empty"
	elif [ $size != 0 ]
	then
		cat $dir
	fi
elif [ "$create" = remove ]
then
	grep -v $name $dir > tmpdir && mv tmpdir dir.txt
	#sed -i '/$name/d' $dir

elif [ "$create" = clear ]
then
	> $dir

elif [ "$create" = lookup ]
then
	grep $name -h $dir
fi
