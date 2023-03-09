#!/bin/bash
# myCount.sh <word> <file>
# Counts occurrences of <word> in <file>

WORDCOUNT=0
cat $2 | while read line; do
    for word in $line; do
	if [ "$word" == "$1" ]; then
	    ((WORDCOUNT+=1))
	    echo "WORDCOUNT now $WORDCOUNT"
	fi
    done
done

echo "$1 appears $WORDCOUNT times in $2"
