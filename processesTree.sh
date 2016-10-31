#!/bin/bash

fieldSep="$IFS"
IFS=$'\n'
pList=$(ps axo comm,pid,ppid,start,user | awk 'NR>1 {print $1 " PID:" $2 " PPID:" $3 " Started:" $4 " by:" $5}')

function checkForChild {
        childVar=0
        for i in $* ; do
                if [[ $(echo "$1" | awk '{print "P" $2}') == $(echo "$i" | awk '{print $3}') ]] ; then
                        childVar=1
                        break
                fi
        done
        echo "$childVar"
}

function pSort {
        if [[ $(checkForChild $*) == 1 ]] ; then
                counter=2
                treebuild="-"
                echo "$1"

                for i in $* ; do
                        if [[ $(echo "$1" | awk '{print "P" $2}') == $(echo "$i" | awk '{print $3}') ]] ; then


                                echo "|$treebuild$(pSort ${*:$counter})"
                                echo "|"
                        fi
                        (( counter+=1 ))
                done
        
        else
                echo "$1"
        fi
}


pSort $pList

IFS=$fieldSep
