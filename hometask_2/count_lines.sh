!/bin/bash

if [ -f versions.txt ]
then
    rm versions.txt
fi

wget http://yoko.ukrtux.com:8899/versions.txt
cat versions.txt | sort -V | uniq -c  | sort -n | tail -n1

rm versions.txt
