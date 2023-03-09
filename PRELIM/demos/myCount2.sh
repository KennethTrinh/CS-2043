#!/bin/bash
# myCount2.sh <word> <file>
# Counts occurrences of <word> in <file>

WORDCOUNT=0
while read line; do
    for word in $line; do
	if [ "$word" == "$1" ]; then
	    ((WORDCOUNT+=1))
	    echo "WORDCOUNT now $WORDCOUNT"
	fi
    done
done < <(cat $2)

echo "$1 appears $WORDCOUNT times in $2"
