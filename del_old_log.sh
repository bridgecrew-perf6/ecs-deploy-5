#!/bin/bash

## check min arguments has passed or not
if [ ! "$#" -gt "1" ] 
    then
        echo "Oops! Please pass min 2 arg's as logpath and days ( ex: /logpath 2 )"
        exit 1
fi

list_args="${@:1:${#}-1}"
shift $(($#-1))
DAYS=$(echo $1)

## check days args value is in numbers format or not
if [[ ! "$DAYS" =~ ^[0-9]+$ ]]
    then
        echo "Oops! Please pass days in numbers"
        exit 1
fi


## Delete files
del_old_log() {
for file in $list_args
do
DIFF=$(( ( $NOW - $(date -r "$file" +%s) ) / (24 * 60 * 60 ) ))
     if [ $DIFF -gt $DAYS ]; then
       #rm -r $filename;
      echo "Deleted file:" $file;
      echo "-----------------------------------------------------"
    fi
done
}

## Display basic info about current script
conf() {
NOW=$(date +%s)
date=$(date)
echo "######################################################"
echo "CURRENT DATE : $date" 
echo "######################################################"
echo "REQUESTED FILE's TO DELETE: $list_args"
echo "######################################################"
echo "NO_OF_OLD_DAYS TO DELETE: $DAYS"
echo "######################################################"
}

conf "$@"
del_old_log "$@"
