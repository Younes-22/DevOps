#!/bin/bash

count=1

while [ $count -le 5 ]
do
    if [ $count -eq 3 ]
    then
        ((count++))
        continue
    fi;  
    echo "Count $count"
    ((count++))
done




# for (( i=1; i<=5; i++))
# do

#     if [ $i -eq 3 ]; then
#     continue
#     fi
#     echo "Number: $i"

# done