#!/bin/bash -

# Cybersecurity Ops with bash
# winlog.sh

TGZ=0
if (( $# > 0 ))
then
  if [[ ${1:0:2} == '-z' ]]
  then
    TGZ=1
  fi
fi
SYSNAM=$(hostname)
LOGDIR=${1:-/tmp/${SYSNAM}_logs}

#echo $LOGDIR
mkdir -p $LOGDIR
cd ${LOGDIR} || exit -2

wevtutil el | while read ALOG
do
  ALOG="${ALOG%$'\r'}"
  echo "${ALOG}:"
  SAFNAM="${ALOG// /_}"
  SAFNAM="${SAFNAM//\//-}"
  wevtutil epl "$ALOG" "${SYSNAM}_${SAFNAM}.evtx"
done

if ((TGZ == 1))
then
  tar -czvf ${SYSNAM}_logs.tgz *.evtx
fi