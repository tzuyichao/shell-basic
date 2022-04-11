#!/bin/bash -
#
# Cybersecurity Ops with bash
# typesearch.sh
DEEPORNOT="-maxdepth 1"

CASEMATCH='-i'

PATTERN=${1:-PDF document}
STARTDIR=${2:-.}

find $STARTDIR $DEEPORNOT -type f | while read FN
do
  file $FN | egrep -q $CASEMATCH "$PATTERN"
  if (( $? == 0 ))
  then
    echo $FN
  fi
done