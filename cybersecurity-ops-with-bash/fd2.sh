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
do
    read aline <&4 || break
    read bline <&5 || break
    # echo $aline
    # echo $bline
    [[ $aline == $bline ]] && continue;
    HOSTA=${aline%% *}
    PORTSA=( ${aline#* })
    HOSTB=${bline%% *}
    PORTSB=( ${bline#* })
    echo $HOSTA
    #echo $PORTSA
    #echo $HOSTB
    #echo $PORTSB
    for porta in ${PORTSA[@]}
    do
        LOOKFOR=$porta NotInList ${PORTSB[@]} && echo " closed: $porta"
    done
    
    for portb in ${PORTSB[@]}
    do
        LOOKFOR=$portb NotInList ${PORTSA[@]} && echo " new: $portb"
    done
done 4< ${1:-day1.data} 5< ${2:-day2.data}
