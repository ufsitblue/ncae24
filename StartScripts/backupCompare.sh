#!/bin/bash
if [ -d "/.backup" ]; then
  diff -r /etc "/.backup/etc"
  if [ -d "/var/www" ]; then
    diff -r /var/www "/.backup/var/www"
  fi
  if [ -d "/var/www-html" ]; then
    diff -r /var/www-html "/.backup/var/www-html"
  fi
else
  echo -e "\e[31mYour files have not been backed up yet!\e[0m"
fi
