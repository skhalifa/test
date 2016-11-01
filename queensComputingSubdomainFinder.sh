#!/bin/bash
for i in {0..255};do
	for j in {0..255};do
		addr=$(nslookup 130.15.$n.$m | grep 'name = ' | awk '{print $4}')
done < /tmp/mylist | sort -u | awk '{printf "%s ", $0} END {printf "/n"}' > outputfile
echo $outputfile

