#!/bin/bash

# Checking for redteam files
echo "Redteam files found:"
find / -type f -iname "*redteam*" -o -type d -iname "*redteam*" 2> /dev/null

# Checking for processes running in strange places
echo "Processes running in unusual directories"
ps aux | awk '$11 !~ /^\/(sbin|bin|usr|var|lib|sys|proc|dev|tmp|run|root|home|etc)\// {print}'

# Checking for recently created files
echo "Recently created files:"
find / -type f -mtime -3 2>/dev/null

# Finding packages installed not using dpkg
comm -13 <(cat /var/lib/dpkg/info/*.list | sort -u) <(find / | sort -u) # Debian
comm -13 <(rpm -qla | sort -u) <(find / | sort -u) # CentOS

# Finding packages installed not using dpkg (Debian) or rpm (CentOS)
if [ -x "$(command -v dpkg)" ]; then
    echo "Packages installed not using dpkg (Debian):"
    comm -13 <(dpkg -l | awk '/^ii/ {print $2}' | sort -u) <(find / -type f -exec dpkg -S {} + 2>/dev/null | cut -d: -f1 | sort -u)
fi

if [ -x "$(command -v rpm)" ]; then
    echo "Packages installed not using rpm (CentOS):"
    comm -13 <(rpm -qa | sort -u) <(find / -type f -exec rpm -qf {} + 2>/dev/null | sort -u)
fi
