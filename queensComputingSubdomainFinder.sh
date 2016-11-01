#!/bin/bash
for i in $(seq 0 255);do
	for j in $(seq 0 255);do
		address=$(nslookup 130.15.$i.$j | grep 'name = ' | awk '{print $4}')
		if((${#address}!=0));then
			echo 130.15.$i.$j = $address;
		fi
	done
done



