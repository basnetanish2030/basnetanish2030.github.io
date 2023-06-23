#!/bin/sh

CONTACT_BOOK=contact_book.txt

echo "Available Options"
echo "i : To insert new entry"
echo "e : To edit existing entry"
echo "d : To delete exisiting entry"
echo "a : To show all entries"
echo "s : To search for any entry"

#Insertion takes the new entries
Insertion(){
	echo "------------Create New Entry-------------"
	read -p "Enter the name:" NAME
	read -p "Enter phone number:" PHONE
	read -p "Enter the address:" ADDRESS

	echo $NAME $PHONE $ADDRESS >> $CONTACT_BOOK
}

#ShowAll() function displays all entries in the contact book file
ShowAll(){
	echo "------------All Entries--------------"
	cat $CONTACT_BOOK | column
}

#Searching() function allows the user to search for specific entry by name or phone or address.
Searching(){
	echo "-----------Search Results-------------"
	read -p "Enter name or phone or address:" KEY

	cat $CONTACT_BOOK | grep -i $KEY
}

#Update() function allows the user to edit the particukar portion of data from the entries.
Update(){
	echo "----------Updating the Entry-----------"
	read -p "Enter existing name or phone or address:" KEY
	read -p "Enter replacing name or phone or address:" REPLACE

	sed -i "s/$KEY/$REPLACE/" $CONTACT_BOOK
}

#Deletion() function allows the user to delete the particular entry by specifying the name or address or phone.
Deletion(){
	echo "---------Delete a entry-------------"
	read -p "Enter name or phone or address:" KEY
	sed -i "/$KEY/d" $CONTACT_BOOK
	echo "Successfully Deleted"
}


#Using until loop to iterate the case statements again and again until :q is given as an option.
until [$OPTION = "q"]
do
echo "Please enter an option:"
read OPTION


case "$OPTION" in
	"i") Insertion
	;;
	"e") Update
	;;
	"d") Deletion
	;;
	"a") ShowAll
	;;
	"s") Searching
	;;
	*) echo "Invalid option selected"
	;;

esac
done
