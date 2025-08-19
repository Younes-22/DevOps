#!/bin/bash

# Mission: Create a script that searches for a specific word or phrase across all .log files in a directory and outputs the names of the files that contain the word or phrase.

search(){
    local directory=$1
    local word=$2
    grep -l "$word" "$directory"/*.log
}