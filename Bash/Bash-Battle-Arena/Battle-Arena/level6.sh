#!/bin/bash

process_file(){
    if [ -z "$1" ]; then
        echo "No file provided"
        exit 1
    fi

    if [ ! -f "$1" ]; then
        echo "File not found!"
        exit 1
    fi

    LINE_COUNT=$(wc -l < "$1")
    echo "The file '$1' has $LINE_COUNT lines."
}
process_file "read.txt"


# echo pwd: $(pwd)
# process_file(){
#     filename=$1
#     if [[ -f "$filename" ]]; then
#         echo "Processing file: $filename"
#         while IFS= read -r line; do
#             echo "Line: $line"
#         done < "$filename"
#     else
#         echo "File not found: $filename"
#     fi
# }
# process_file "read.txt"