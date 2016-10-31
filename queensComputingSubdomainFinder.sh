#!/bin/bash
domain="cs.queensu.ca"
while read -r domain
do
	dig +short "$domain"
done < /tmp/mylist | sort -u | awk '{printf "%s ", $0} END {printf "/n"}' > outputfile
echo $outputfile

