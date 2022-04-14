#!/bin/bash

file_1=$1
file_2=$2

if [ $# -ne 2 ]
then
    echo "Please enter exactly 2 filenames as arguments"
    exit 1
elif [[ -f $file_1 ]]
then
    # Print the necessary columns using $1 $2 commands of awk
    awk -F "\"*,\"*" '{print $1,$2,$3,$5,$6,$7,$10,$11}' < $1 > $2
    # Print the name of the college if the highest degree is Bachelor's
    awk -F "\"*,\"*" '{if($3 == "Bachelor'"'"'s") print $1;}' < $1 >> $2     
    # Simple print statement using awk
    awk -F "\"*,\"*" 'BEGIN {print "Geography: Average Admission Rate"}' < $1 >> $2
    # Firstly Store all different geography present in the college.csv file in the geogrpahy array and create an counter array to store its frequency and append both the arrays as we read all rows and finally print the average.
    awk -F, 'NR>1 {geography[$6]+=$7;counter[$6]++}END{for(i in geography)printf i": %.3f\n",geography[i]/counter[i];}' $1 >> $2
    # Firstly reverse sort the data using -rt command w.r.t 16th column using -nk16 command and store the value in temp.txt file. 
    sort -rt, -nk16 < $1 > temp.txt
    # Now print the first 5 college names which are also the highest median earning colleges.
    awk -F "\"*,\"*" '{print $16}  NR==5{exit}' < temp.txt >> $2

else 
    echo "Input file does not exits"
fi

exit 1


