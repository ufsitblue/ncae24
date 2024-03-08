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
done
