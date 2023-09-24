#!/bin/bash

# echo </dev/tcp/10.0.2.6/22

function scan()
{
	host=$1
	printf '%s' "$host"
	for ((port=1;port<1024;port++))
	do
		echo >/dev/null 2>&1 < /dev/tcp/${host}/${port}
		if (($? == 0)) ; then printf ' %d' "${port}" ; fi
	done
	echo
}

# scan "10.0.2.6"

printf -v TODAY 'scan_%(%F)T' -1
OUTFILE=${1:-$TODAY}

while read HOSTNAME
do
	scan $HOSTNAME
done > $OUTFILE
