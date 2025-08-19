#!/bin/bash

# conditional statements

# -f checks if a file exists and is a regular file

cd "Arena"
echo "pwd: $(pwd)"

if [[ -f "hero.txt" ]]; then
    echo "Hero found!"
else
    echo "Hero missing!"
fi