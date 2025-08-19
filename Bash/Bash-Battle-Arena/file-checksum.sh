#!/bin/bash
# checksums are used to verify the integrity of files by generating a unique hash value based on the file's content. This allows you to detect any changes or corruption in the file.

compare_checksums(){
    local checksum1="$1"
    local checksum2="$2"
    if [[ "$checksum1" == "$checksum2" ]]; then
        echo "Checksums match."
    else
        echo "Checksums do not match. File integrity compomised" 
    fi
}

compare_checksums "123" "123"


# calculate_sha256sum(){
#     local file_path="$1"
#     sha256 "$file_path"

# }
# calculate_sha256sum "read.txt"

# calculate_md5sum(){
#     local file_path="$1"
#     md5sum "$file_path"

# }
# calculate_md5sum "read.txt"