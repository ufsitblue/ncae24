# Using the scripts
If using git: `sudo apt-get install git`, `sudo git clone https://github.com/ufsitblue/ncae24`

Do `touch <script>` `chmod 700 <script` `nano <script>` and then copy paste the script into there. All scripts should be run with sudo permissions.

## Package manager by Machine
- **Kali/Ubuntu**: apt-get
- **CentOS**: yum
- zypper
- pacman
## Do this FIRST
1. `dpkg -V` to check for `??5?????` (indicates changes)
    - `apt-install -reinstall <package>` for all of the `??5?????`
2. run killALL.sh `sudo ./killALL.sh`
    - Check `/etc/crontab` for any malicious commands
3. run al.sh `sudo ./al.sh`
    - Change any aliases that seem sus
4. run pass.sh `sudo ./pass.sh <new passwd>`
    - Note that running the command **without** passwd argument just changes all the keys and secures ssh, running it **with** passwd argument will also reset all user passwds to that passwd
    - If there are any sus `/bin/bash` in `/etc/passwd` (not root or your user), deal with it
5. `sudo visudo` to see if anyone has elevated privileges
6. Clean up users
    - `sudo userdel -r <user>`
7. `cat /etc/group | grep 'adm\|root\|sudo'` to check groups
    - `deluser <user> <group>` to remove any sus group assignments
8. Run hunt.sh `sudo ./hunt.sh`
    - This will alert you of any sus files. Whether they are truly threats will be up to your discretion. Any sus files should be deleted/changed manually.
9. Now you can do your stuff :)
10. Run backup.sh when you want to backup your files `sudo ./backup.sh <ssh directory> <device name> -y`
    - Make sure you have ssh key authentication working (backup device needs your working device's ssh keys), otherwise the ssh won't work in a script file
    - The device name should be unique for each device and helps us organize directories in the backup server
    - **Without** the -y flag, this script will compare changes between your local files and those in the backup. **With** the -y flag, it will also update the backup with your current files
