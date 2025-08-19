#!/bin/bash
# two ways to read a file in bash:


process_file(){
    local file_path="$1"
    cat "$file_path" | while IFS= read -r line; do
        echo "Processing Line: $line"
        done
}
process_file "./logs.txt"

# read_file() {
#     local file_path="$1"
# # When you do IFS=, you're saying:
# # “Hey! Don’t split anything at all. Just give me the full line exactly as it is.”
# # read grabs one line of input and stores it in a variable (like line).
# # Each time the while loop runs, it grabs the next line.
# # -r option prevents backslashes from being interpreted as escape characters.
#     while IFS= read -r line; do
#         echo "$line"
#     done < "$file_path"
# }
# read_file "logs.txt"