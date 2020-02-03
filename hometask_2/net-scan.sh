#! /bin/bash

for i in $@;
do
    nc -vnz $i 80 -w1 2>&1 | grep succeeded
    nc -vnz $i 443 -w1 2>&1 | grep succeeded
done