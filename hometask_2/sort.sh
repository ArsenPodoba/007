#! /bin/bash
if [ -f versions.txt ]
then
    rm versions.txt
fi
wget http://yoko.ukrtux.com:8899/versions.txt
sorted_version=($(cat versions.txt | sort -V))
printf '%s\n' "${sorted_version[@]}" | tee versions.txt
