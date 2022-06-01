Path=$(pwd)
sub_dir=$(ls $Path/A)
for sd in $sub_dir
do
 cd $Path/A
 file=$(find . -name $sd.txt)
 sha1sum $file | awk '{print $2 "\t" $1}' >> /root/test/hash.log
done
cat /root/test/hash.log
