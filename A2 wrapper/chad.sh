#!/bin/bash

# Change to the base directory

cd A2

# Check write permissions for sentence.txt

if [ ! -w "sentence.txt" ]; then
chmod +w sentence.txt
fi

# Clear sentence.txt file

echo -n "" > sentence.txt

# Define the sequence of directories

directories=(adjectives nouns adverbs verbs adjectives nouns)

sentence="The"
for dir in "${directories[@]}"; do
  cd $dir
  word=$(ls | sort -R | head -n 1 | tr -d "\n")
  if [ $dir == "verbs" ]; then
    sentence="$sentence $word the"
  else
    sentence="$sentence $word"
  fi
  cd ..
done

# Write the sentence to sentence.txt and display it

echo "$sentence." >> sentence.txt
cat sentence.txt