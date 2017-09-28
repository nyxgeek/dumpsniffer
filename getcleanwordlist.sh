#!/bin/bash
echo "WARNING: THIS WILL TAKE APPROX 2-3GB FREE SPACE TEMPORARILY. Just a heads-up"

#download wordlist

echo "Downloading file now"
curl -k -o /tmp/troydump_v1.7z "https://hashes.org/download.php?type=leak&id=6505&list=found"

echo "Download complete. Extracting ... (this WILL take a while) "
7z x -o/tmp/ /tmp/troydump_v1.7z


grep -x '.\{0,24\}' /tmp/6505_found_sorted.txt | tr -dc '[[:alnum:]][[:space:]][[:punct:]]' | perl -nle 'print if m{^[[:ascii:]]+$}' | grep -v -E '^[[:punct:]]{0,}$' |  sed -e 's/^[ \t]*//' | grep -v '^ *$'  > TROYDUMP.v1.txt

echo "Here is a sample of the text file"
head TROYDUMP.v1.txt


echo "Saved to TROYDUMP.v1.txt"

echo "Would you like to remove the downloaded files?"
read TMPLINE
TMPLINE=`echo "$TMPLINE" | tr '[:upper:]' '[:lower:]' `

if [ "$TMPLINE" == "y" ]; then
	rm /tmp/troydump_v1.7z
	rm /tmp/6505_found_sorted.txt
	echo "Files removed. Operation complete."
else
	echo "Operation complete. Original files are stored under /tmp/troydump_v1.7z and /tmp/6505_found_sorted.txt"

fi
