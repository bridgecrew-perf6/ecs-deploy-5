#!/bin/bash
DAYS=7
del_old_log() {
first=$(ls -lt $1 | grep $(date +%b)| tail -n 1 | awk '{print $NF}')
mv $first ../
list=$(ls $1)
for dir in $list
do
DIFF=$(( ( $NOW - $(date -r "$dir" +%s) ) / (24 * 60 * 60 ) ))
     if [ $DIFF -gt $DAYS ]; then
       #rm -r $dir
      echo "Deleted $dir:" $dir;
      echo "-----------------------------------------------------"
    fi
done
}
conf() {
NOW=$(date +%s)
date=$(date)
echo "######################################################"
echo "CURRENT DATE : $date"
echo "######################################################"
echo "NO_OF_OLD_DAYS TO DELETE: $DAYS"
echo "######################################################"
}
conf "$@"
del_old_log "$@"
