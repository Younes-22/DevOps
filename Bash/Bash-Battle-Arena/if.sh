#!/bin/bash

age=19

if [ $age -gt 18 ]
then
# code block to be executed if condition is true
    echo "You are an adult."
elif [ $age -ge 7 ]
then
    echo "You are not an adult."
else
    echo "You are a toddler"
fi

# eq="="
# ne="!="
# lt="<"
# le="<="
# gt=">"
# ge=">="
# &&="&&"
# ||="||"