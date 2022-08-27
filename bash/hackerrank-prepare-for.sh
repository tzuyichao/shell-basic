#!/bin/sh

for i in {1..99}; do
    if [ $(( i % 2 )) == 1 ]; then
        echo "$i"
    fi
done
