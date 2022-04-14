#!/bin/bash

#echo "Hello MF hurray"

count=1
if [ $count -eq 10 ]
then
    echo "yes"
elif (( $count > 10 ))
then
    echo "huehuehue"
elif (( $count < 10 )) && [ $count -ge 5 ]  
then
    echo "omg"
else 
    echo ""
fi

while(( count < 5 ))
do
    echo $count
    count=$[ count+1 ]
done