# Using the scripts
NOTE: many of these scripts _warn_ you about threats and tells you where they are located. You must actually fix the threats yourself!
- **al.sh**: Warns you of any sus aliases
- **backup.sh**: Backs-up `/etc` and `/var/www`  to the `/.backup` directory
- **hunt.sh**: Warns you of several threats (Redteam files, Recently modified files, strange packages, orphan files, promiscuous interfaces)
- **killALL.sh**: Disables cronjobs by added `.dead.` to file names. **REMOVES** netcat, ansible, and at
- **payload.sh**: Deteccts Go and Sliver binaries
- **pkgUpdate.sh**: Updates packages. Warns you about compromised packages
- **ssh.sh**: Secures ssh by **CHANGING** keys and disabling authorized_keys by renaming to `unauthorized_keys.`
- **suid.sh**: Finds suid binaries
- **users.sh**: Warns you about users currently logged in and users that can run commands.


## Package manager by Machine
- **Kali/Ubuntu**: apt-get
- **CentOS**: yum
- zypper
- pacman
