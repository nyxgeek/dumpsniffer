#!/bin/bash

#read in location of dumpfile from dumpsniff.conf
DUMPFILE=`grep DUMPFILE dumpsniff.conf | cut -d\= -f2-`
TMPFILE=`grep TMPFILE dumpsniff.conf | cut -d\= -f2-`


if ! [ -e "./db/a" ]; then
	echo "Could not find db folder - creating a new folder structure."
	mkdir ./db;for i in {a..z}; do mkdir ./db/$i; done
fi


if ! [ -e "$DUMPFILE" ]; then
	echo "Dump file not found, would you like to download and clean the Troy Hunt dump from hashes.org? (y/n)"
	echo "Warning: this WILL take a while"
	read TMPLINE
	TMPLINE=`echo "$TMPLINE" | tr '[:upper:]' '[:lower:]' `

	if [ "$TMPLINE" == "y" ]; then
		./getcleanwordlist.sh
		echo "completed downloading and cleaning"
		echo "updating dumpsniff.conf to point to new file"
		sed -i -e 's/^DUMPFILE=.\{0,\}/DUMPFILE=TROYDUMP.v1.txt/' dumpsniff.conf
		echo "Here is the new dumpsniff.conf:"
		head dumpsniff.conf
	else
		echo "-------------------------------------------------------"
		echo "Dump file not found - exiting. Please update dumpsniff.conf to point to a file to search."
		echo "The line should look like:"
		echo "DUMPFILE=/path/to/dumpfile.txt"
		echo ""
		exit 1
	fi


fi


#cleanup temp file if it exists
if [ -e "$TMPFILE" ]; then
	rm "$TMPFILE"
fi



RESULTSARRAY=()

# cycle through args
#list=${@}
for var in "$@"
do
    #strip out non-alphanumberic chars from search

    searchvar=`echo $var | grep -o -e '[a-zA-Z0-9^]\{1,\}'`

    #we need to keep our search term with ^ in it, but clean our actual var for saving
    if [[ "$searchvar" == "^"* ]]; then
       var=`echo "$var" | grep -o -e '[a-zA-Z0-9]'`
    fi

    #figure out what folder to save to
    FIRSTLETTER=${var:0:1}
    OUTPUTFILE="./db/$FIRSTLETTER/$var.out.txt"

    if [ -e "$OUTPUTFILE" ]; then
	    echo "Found existing file for '$var' at '$OUTPUTFILE'"
    else
	    #echo "Searching for '$var'"
	    grep -i "$searchvar" "$DUMPFILE" > "$OUTPUTFILE"

    fi
    COUNT=`wc -l "$OUTPUTFILE" | awk '{print $1}'`
    echo "$var has     ...     $COUNT"

    RESULTSARRAY+=("$COUNT, $var")

    #write to log - change this
    #echo "$COUNT,$var" >> "$TMPFILE"

done


echo "Search complete:"
printf '%s\n' "${RESULTSARRAY[@]}" | sort -nr
