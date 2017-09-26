#!/bin/bash



if [ "$1" != "" ]; then

	SEARCHSTRING="$1"

else

	echo "Enter a term to view results:"
	read line
	SEARCHSTRING="$line"
fi


FIRSTLETTER=${SEARCHSTRING:0:1}
OUTPUTFILE="./db/$FIRSTLETTER/$SEARCHSTRING.out.txt"


if  [ -e "$OUTPUTFILE" ]; then

#	if you want to search for only ones that BEGIN with the searchword
#	grep -o -e "^$SEARCHSTRING[a-zA-Z ]\{0,\}" "$OUTPUTFILE" | sort | uniq -c | sort -nr | head -n 50
	grep -o -e "$SEARCHSTRING[a-zA-Z ]\{0,\}" "$OUTPUTFILE" | sort | uniq -c | sort -nr | head -n 50

else

	echo "$SEARCHSTRING was not found in the db. Would you like to search for it now? [y/n]"
	read doordonot

	if [ "$doordonot" == "y" ]; then

		./popcon.sh $SEARCHSTRING
		echo "entries added"
		echo "------------------------------------------"

		#now run it
#		this should really just be a function - will update later
#		this first is if you want to search for only ones that BEGIN with the searchword
#		grep -o -e "^$SEARCHSTRING[a-zA-Z ]\{0,\}" "$OUTPUTFILE" | sort | uniq -c | sort -nr | head -n 50
		grep -o -e "$SEARCHSTRING[a-zA-Z ]\{0,\}" "$OUTPUTFILE" | sort | uniq -c | sort -nr | head -n 50
		

	else

		exit

	fi


fi
