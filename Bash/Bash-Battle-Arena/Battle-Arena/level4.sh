#!/bin/bash

# Level 4: File Manipulation
# Mission: Create a script that copies all .txt files from the Arena directory to a new directory called Backup.

mkdir -p "Backup"
cp Arena/*.txt Backup/
echo "All .txt files have been copied to the Backup directory."
