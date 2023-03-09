#!/bin/bash

#
# CS2043:  Lecture #4, Demo #2
#
# Are you old enough to vote?
#

#
# Script makes use of some syntax we haven't learned yet,
# but still interesting to look at
#

# read a value into a variable named "age"
# -p caused a prompt to be printed
read -p "How old are you? " age

#
# [ $age -lt 18 ] is a condition that is true if the value
# in $age is LESS THAN the constant 18
#

if [ $age -lt 18 ]  
then
	echo "You are a Loser"
else
	echo "You ARE a Loser"
fi
