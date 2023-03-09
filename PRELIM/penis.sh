#!/bin/bash

# # find all files accessed at least 

# for ((i=0; i<100; i++)) do
#     if [ $i -eq 1 ]; then
#         echo "1"
#     elif [ $i -eq 2 ]; then
#         echo "1"
#     else
#         echo `expr $i - 1` + `expr $i - 2`
#     fi
# done
#  tr ‘a-z’ ‘A-Z’ << END_TEXT

# find . -amin -10 -exec cat {} \;

# find . -name ".DS_Store" -exec rm -f {} \;

# sort -n -k 3 numbers.txt




# echo * | tr ' ' '\n'


function printArgs () {
    for i in $@; do # iterates over all arguments
        echo $i
    done 
}

# args=$(printArgs $@)

function q14 () {
    while read line; do
        name=$(echo "$line" | cut -d ' ' -f 2)
        case "$line" in 
            *100 )
                echo "$name, EXCELLENT JOB!"
                ;;
            *9[0-9] )
                echo "$name, GREAT JOB!"
                ;;
            *8[0-9] )
                echo "$name, GOOD JOB."
                ;;
            * ) 
                echo "$name,  MORE REVIEW NEEDED. "
                ;;
            esac
    done < marks.txt
}


function q15(){
    array=(1 2 3 4 5 6 7 8 9 10)
    for ((i=0; i<${#array[@]}; i++)); do
        echo "${array[$i]}"
    done
    some_array=(zero one two)
    echo ${some_array[0]}

}




#### FOR LOOPS ####

function forloops() {
    # way 1
    for var in s1 s2 s3 s4 s5; do
        echo $var
    done

    # way 2
    for var in {00..10}; do
        echo $var
    done

    # way 3
    for ((i=0; i<10; i++)); do
        echo $i
    done

    # way 4
    # nums=(1 2 3 4 5)
    # res=0s
    # for i in ${nums[@]}; do 
    #     res=$((res + i))
    # done
    # echo $res
}

function ifStatements() {
    function compare() {
        if [[ $1 -gt $2 ]]; then
            echo "$1 is greater than $2"
        elif [[ $1 -lt $2 ]]; then
            echo "$1 is less than $2"
        else
            echo "$1 is equal to $2"
        fi
    }
    compare 1 2
    if [[ $1 -gt $2 ]] || [[ $1 -lt $2 ]]; then
        echo "$1 is not equal to $2"
    else 
        echo "$1 is equal to $2"
    fi
    
}

function Arguments() {
    echo "Number of arguments: $#"
    echo "All arguments: $@"
    echo "First argument: $1"
    echo "Second argument: $2"
    echo "Arguments as one string: $*"
    for i in $@; do
        echo "for loop: $i"
    done
}
# Arguments 1 2

function whileLoops() {
    s="a"
    while [[ $s != "aaaa" ]]; do
        echo $s
        s="a$s"
    done
    echo $s

    while read -r line; do
        echo $line
    done < marks.txt

    x=0
    while ((x < 10)); do
        echo $x
        x=$((x + 1))
    done

    

    # read var < marks.txt
    # echo $var


}
# whileLoops

function Regex() {
    grep -E '[[:alpha:]]+ [[:digit:]]+' marks.txt

    grep -E ' [89][[:digit:]] ' marks.txt
    # this means match a space, then a 8 or 9, then any digit, then a space

    sed 's/Physics/Chemistry/g' marks.txt

}
# Regex

function Wildcards() {

    echo *.txt | tr ' ' '\n'
    # all txt files in current directory
    echo inpu?.txt | tr ' ' '\n'
    


}
# Wildcards

function AWK() {
    # awk <pattern> <file>
    # the $1 is the first column
    awk '{print $1}' marks.txt
    # the $0 is the whole line
    awk '{print $0}' marks.txt
    # print lines containing an s
    awk /.*s.*/{print} marks.txt
    # awk /Physics/ marks.txt
    awk 'BEGIN{x=5; y=10; z=x+y; print z}'
    # look for an s and grade in the 80s 
    awk '/s/ && /8./{print}' marks.txt
    # if there's an s, look for grade in 80s, otherwiise look for grade in 90s
    awk '/s/?/8./: /9./{print}' marks.txt
    # print all lines that do not contain an s
    awk '!/s/{print}' marks.txt
    # 
    awk '!/[X]/ {print}' marks.txt
}
# AWK


function Cut() {
    # cut -d <delimiter> -f <field> <file> [-s]
    # -s suppresses lines with no delimiter
    cut -d, -f1 -s employees.csv
    cut -d, -f1,3 -s employees.csv # fields 1 and 3
    cut -d , -f4- -s employees.csv # all fields after 4

}
# Cut

function Sed() {
    # sed [options] <script> <file>

    # delete all lines with a regex: sed '/regex/d' <file>
    sed '/Physics/d' marks.txt

    # substitue (find/ replace): sed 's/find/replace/g' <file>
    sed 's/Physics/Chemistry/g' marks.txt > new_marks.txt

    # without g, only the first instance of find is replaced
    
}
# Sed

function Switch() {
    case $1 in
        "A")
            echo "one"
            ;;
        "B")
            echo "two"
            ;;
        *)
            echo "not one or two"
            ;;
    esac
}
# Switch $1

function ProcessSub() {
    count=0
    function helper() {
        while read line; do
            for word in $line; do
                # word=$(echo $word | tr -d '\n') ^[0-9]+$
                if [[ $word =~ [[:digit:]] && $word == $1 ]]; then
                    ((count++))
                fi
            done
        done < $2
    }
    helper $1 $2 <(cat $2)
    echo $count
}
# ProcessSub 90 marks.txt