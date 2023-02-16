#!/bin/bash

# chmod +x gitMetricsForUser.sh

# check that path to git repository is provided
if [ -z "$2" ]; then
  echo "usage: gitMetricsForUser username repository"
  exit 1
fi

# check the repository exists
if [ ! -d "$2" ]; then
  echo "$0: $2: Not a directory"
  exit 2
fi

# change into the git repository directory
cd $2

# find the number of commits of an author
commits=$(git log --author="$1" --oneline | wc -l | tr -d '[:space:]')

# find the longest message of an author using read and process substitution
longest_message=""
while read -r line; do
  if [ ${#line} -gt ${#longest_message} ]; then
    longest_message=$line
  fi
done < <(git log --author="$1" --pretty=%B)

# longest_message=$(git log --author="$1" --pretty=format:"%B" | awk '{ if (length > max) { max = length; longest = $0 } } END { print longest }')

# print the results
echo "User $1 has made $commits commits"
echo $'Longest message:\n'
echo "$longest_message"
