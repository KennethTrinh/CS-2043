#!/bin/bash
# Prompt user to enter NetID
while true; do
    read -p "Enter your NetID: " input
    read -p "You entered $input, is this correct? " yn
    case $yn in
	[Yy]* ) echo "Thank you $input, generating file to submit"
		break;;
	* ) echo "Please try again";;
    esac
done

netid=`echo $input | awk '{print tolower($0)}'`

if type "md5sum" > /dev/null 2>&1; then
    echo $netid | md5sum | awk '{print $1}' > ~/CS2043-A1-SubmitThisFile.txt
else if type "md5" > /dev/null 2>&1; then
    echo $netid | md5 > ~/CS2043-A1-SubmitThisFile.txt
     else
	 echo $netid > ~/CS2043-A1-SubmitThisFile.txt
     fi
fi

