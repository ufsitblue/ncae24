# Using the scripts
Do `touch <script>` `chmod 700 <script` `nano <script>` and then copy paste the script into there. All scripts should be run with sudo permissions.

## Do this FIRST
1. `dpkg -V` to check for `??5?????` (indicates changes)
    - `apt-install -reinstall <package>` for all of the `??5?????`
2. run killALL.sh `sudo ./killALL.sh`
    - Check `/etc/crontab` for any malicious commands
3. run al.sh `sudo ./al.sh`
    - Change any aliases that seem sus
4. run pass.sh `sudo ./pass.sh`
    - If there are any sus `/bin/bash` in `/etc/passwd` (not root or your user), deal with it
5. `sudo visudo` to see if anyone has elevated privileges
6. Clean up users
    - `sudo userdel -r <user>`
7. `cat /etc/group | grep 'adm\|root\|sudo'` to check groups
    - `deluser <user> <group>` to remove any sus group assignments
8. Now you can do your stuff :)
