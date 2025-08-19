#!/bin/bash

DIRECTORY="Arena"

if [ ! -d "$DIRECTORY" ]; then
    echo "Directory does not exist."
    exit 1
fi

find "$DIRECTORY" -type f -name "*.txt" -exec ls -lh {} + | sort -k 5,5 -h | awk '{ print $5, $9 }'





# sort_size(){
#     local directory=$1
#     if [ -z "$directory" ]; then 
#         echo "Directory wasn't added"
#         exit 1
    
#     fi
#     if [ ! -d "$directory" ]; then 
#         echo "Directory not found"
#         exit 1
    
#     fi
#     sort_list=$(ls -Sr $directory/*.txt)
#     echo "the order in size is:"
#     echo "$sort_list"
# }

# sort_size "Arena"

