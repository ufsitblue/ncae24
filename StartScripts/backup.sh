#!/bin/bash
if [ ! -d "/.backup" ]; then
  mkdir /.backup
fi
rsync -av /etc "/.backup"
if [ -d "/var/www" ]; then
  rsync -av /var/www "/.backup"
fi
if [ -d "/var/www-html" ]; then
  rsync -av -e ssh /var/www-html "/.backup"
fi
