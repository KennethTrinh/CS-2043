#!/bin/bash

# for loop to print arguments passed to shell
for var in $@; do
    echo "Next argument is $var"
done

for (( i=1; i<=$#; i++ )) do
    # Use special bash notation for parameterizing the nth argument
    echo "Argument $i is ${!i}"
done
    


