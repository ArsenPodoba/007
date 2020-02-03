#! /bin/bash
bash=`which bash`
echo SHELL=$bash > tempf
echo 'PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin' >> tempf
echo 'MAILTO=root' >> tempf
echo '0 0 * * 0 /usr/bin/apt-get -y update >> /var/log/update-"$(date +\%y\%m\%d)".log 2>&1' >> tempf
echo '0 0 * * 0 /usr/bin/apt-get -y upgrade >> /var/log/update-"$(date +\%y\%m\%d)".log 2>&1' >> tempf
sudo crontab tempf
rm tempf