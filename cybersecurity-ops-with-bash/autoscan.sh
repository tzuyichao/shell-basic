#!/bin/bash

./scan.sh < hostlist

FILELIST=$(ls scan_* | tail -2)
FILES=( $FILELIST )

TMPFILE=$(tempfile)

./fd2.sh ${FILES[0]} ${FILES[1]} > $TMPFILE

if [[ -s $TMPFILE ]]
then
    echo "mailling today's port differences to $USER"
    mail -s "Today's port differences" $USER < $TMPFILE
fi

rm -f $TMPFILE