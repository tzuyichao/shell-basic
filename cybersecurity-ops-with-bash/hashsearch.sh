#!/bin/bash -
# Cybersecurity Ops with bash
# hashsearch.sh
# usage:
# ./hashsearch.sh [HASH] [DIR]

HASH=$1
DIR=${2:-.}

function mkabspath ()
{
    if [[ $1 == /* ]]
    then
      ABS=$1
    else
      ABS="$PWD$1"
    fi
}

find $DIR -type f |
while read fn
do
  THISONE=$(sha1sum "$fn")
  # echo $THISONE
  THISONE=${THISONE%% *}
  # echo $THISONE
  if [[ $THISONE == $HASH ]]
  then
    mkabspath "$fn"
    echo $ABS
  fi
done