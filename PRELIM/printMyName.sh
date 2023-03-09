#!/bin/bash

# print my name 10 times
for var in {1..10}; do
    echo "Ron"
done

echo "Try it a different way..."

# Now do it with "classic" syntax
for (( i=0; i<=10; i++ )); do
    echo "Ron"
done

