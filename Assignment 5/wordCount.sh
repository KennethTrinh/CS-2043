#!/bin/bash

# Check for correct usage
if [ "$#" -ne 1 ]; then
    echo "usage: $0 <filename>"
    exit 1
fi

# Check if file exists
if [ ! -f "$1" ]; then
    echo "$0: $1: Not a file"
    exit 1
fi

# Declare associative array
declare -A wordCount

# Function to count words
function countWords {
    local line=$1
    # Split line into words
    words=($line)
    # Iterate over words
    for word in "${words[@]}"; do
        # Convert word to lowercase
        word=$(echo "$word" | tr '[:upper:]' '[:lower:]')
        # Check if word is already in array
        if [ "${wordCount[$word]}" ]; then
            # Increment count
            wordCount[$word]=$(( ${wordCount[$word]} + 1 ))
        else
            # Add new entry
            wordCount[$word]=1
        fi
    done
}

# Read file line by line
while read line; do
    countWords "$line"
done < "$1"

# Print results
echo "RESULTS"
echo "=================================================="
for word in "${!wordCount[@]}"; do
    count=${wordCount[$word]}
    case $count in
        1)
            echo "'$word' occurs 1 time."
            ;;
        2|3|4)
            echo "'$word' occurs $count times."
            ;;
        *)
            echo "'$word' occurs $count times. WARNING!"
            ;;
    esac
done
