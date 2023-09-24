#!/bin/bash

function NotInList()
{
    for port in "$@"
    do
        if [[ $port == $LOOKFOR ]]
        then
            return 1
        fi
    done
    return 0
}

while true
    read aline
do
done 4< ${1:-day1.data} 5< ${2:-day2.data}