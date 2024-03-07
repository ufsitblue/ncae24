#!/bin/bash

# Generate new ssh keys
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

#Securing user ssh
for user in $(ls /home); do
  if [ -f /home/$user/.ssh/known_hosts ]; then
    rm /home/$user/.ssh/known_hosts
  fi
  if [ -f /home/$user/.ssh/authorized_keys ]; then
    echo "Authorized keys for $user:"
    cat /home/$user/.ssh/authorized_keys
    rename 's/authorized_keys/unauthorized_keys/' /home/$user/.ssh/authorized_keys
  fi
  chmod 700 /home/$user/.ssh/*
done

chmod 640 /etc/shadow

# Currently in
echo -e "\e[32mUsers currently logged in:\e[0m"
who

#Prints out any users with ability to run commands
echo -e "\e[33mUsers that can run commands:\e[0m"
cat /etc/passwd | grep "sh$"

echo -e "\e[31mDon't forget, change your passwords!!!\e[0m"
