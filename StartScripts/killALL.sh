#!/bin/bash

#BYE-BYE CRON
#--------------------------
#Get a list of all user cron files
cron_files=$(find /var/spool/cron/crontabs/ -type f)

# Loop through each cron file and delete it
for file in $cron_files; do
  rm "$file"
  echo "Deleted $file"
done

#Get a list of all /etc/ cron files
cron_files=$(find /etc/cron.* -type f)

# Loop through each cron file and delete it
for file in $cron_files; do
  rm "$file"
  echo "Deleted $file"
done

#Removing all anacron tabs
rm /etc/anacrontab

#Get a list of all user anacron files
anacron_files=$(find /home/*/.anacron -type f)

# Loop through each anacron file and delete it
for file in $anacron_files; do
  rm "$file"
  echo "Deleted $file"
done

systemctl stop cron
#Make sure to manually check /etc/crontab

#BYE-BYE nc
#-------------------------
dpkg -l | grep netcat | awk '{print $2}' | xargs apt-get remove -y #Debian
dpkg -l | grep ncat | awk '{print $2}' | xargs apt-get remove
apt-get remove nc
yum remove nc # CentOS

#BYE-BYE ansible
#-------------------------------
apt-get remove ansible
yum remove ansible

#BYE-BYE at
#-------------------------------
apt-get remove at
yum remove at
