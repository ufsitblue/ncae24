#!/bin/bash
# Argument 1 is what you put when you ssh, Argument 2 is the device name in the backup server

diff -r /etc "$1:/opt/backups/$2/etc"
diff -r /var/www "$1:/opt/backups/$2/var/www"
diff -r /var/www-html "$1:/opt/backups/$2/var/www-html"

if [ $# -eq 3 ]; then
  rsync -av -e ssh /etc "$1:/opt/backups/$2"
  rsync -av -e ssh /var/www "$1:/opt/backups/$2"
  rsync -av -e ssh /var/www-html "$1:/opt/backups/$2"
fi
