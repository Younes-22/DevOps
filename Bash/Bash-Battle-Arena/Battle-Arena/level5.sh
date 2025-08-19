#!/bin/bash
# 1. Creates a directory names 'Battlefield'
# 2. Inside Battlefield, create files named knight.txt, sorcerer.txt, and rogue.txt.
# 3. Check if knight.txt exists; if it does, move it to a new directory called Archive.
# 4. List the contents of both Battlefield and Archive.


mkdir -p "Battlefield"
cd "Battlefield"
touch "knight.txt"
touch "sorcerer.txt"
touch "roge.txt"
if [[ -f "knight.txt" ]]; then
    echo "knight exists"
    mkdir -p "../Archive"
    mv "knight.txt" "../Archive"
    echo "knight moved to Archive"
else
    echo "knight.txt not found"
fi

ls_battlefield=$(ls)
ls_archive=$(ls ../Archive)

echo "Files stored within Battlefield: $ls_battlefield"
echo "Files stored within Archive: $ls_archive"