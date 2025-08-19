#!/bin/bash

age=19
grade=85

if [ "$age" -gt 18 ]; then
    echo "You are elegible based on age"

    if [ "$grade" -ge 80 ]; then
    echo "You are eligible based on grade"
    echo "Congrats! You are elegible"
    else
        echo "Sorry you are not eligible based on grade"
    fi

else
    echo "Sorry you are not eligible"
fi
