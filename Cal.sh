#!/bin/bash

echo "********************************************************************************************"
echo ""


read -p "How many number do you want to calculate-: " count
echo ""
echo "+, -, *, /"
echo ""
read -p "Enter the Operation you want to perform-:" ops
echo ""
sum=0


for ((i=1 ; i -le $count ; i++)) do
	read -p "Enter $i number-:" num

	if ( ops == "+"  ) then
		sum = sum + num
	
	elif ( ops == "-" ) then
		sum = sum - num
	
	elif ( ops == "*" ) then
		sum = sum * num
	
	elif ( ops == "/" ) then
		sum = sum / num
	else
		echo "INVALID OPERSATIO"
	
	fi
done

