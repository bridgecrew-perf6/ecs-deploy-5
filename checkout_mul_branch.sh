#!/bin/bash
#put all repos path in list file
for i in `cat list`
do
cd $i
branch=$(git for-each-ref --shell | awk '{print $3}' | sed "s/'//g")
echo $branch
for br in $branch
do
	echo branch-$br
	git checkout $br
done
cd ..
done
