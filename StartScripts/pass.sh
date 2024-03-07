#!/bin/bash

# Generate new ssh keys
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

#Securing user ssh
rm /home/*/.ssh/known_hosts
rename 's/authorized_keys/unauthorized_keys/' /home/*/.ssh/authorized_keys
chmod 700 /home/*/.ssh/*
chmod 640 /etc/shadow

if [ $# -eq 0 ]; then
  exit 1
fi

# Changing passwd for all users
#users=$(ls -l /home | grep '^d' | awk '{print $3}')
#for u in $users; do
#  echo "$1" | passwd --stdin "$u"
#  echo "Changed passwd for $u"
#done

#Prints out any users with ability to run commands
cat /etc/passwd | grep "/bin/bash"
