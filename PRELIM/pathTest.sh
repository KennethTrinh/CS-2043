#!/usr/bin/env bash

# get path from user
read -p "Enter a path: " path 

if [[ -e "$path" ]]; then
    echo "Path '$path' exists."
    if [[ -f "$path" ]]; then
	echo "--> Path '$path' is a file."
    elif [[ -d "$path" ]]; then
	echo "--> Path '$path' is a directory."
    fi
else
    echo "Path $path does not exist."
fi
