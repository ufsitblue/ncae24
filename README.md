# NCAE 2024: UF

## Checklist for ALL
1. Change passwords for our user and root _except_ for scored users
2. Change ssh keys by running `ssh.sh`
3. Have local backups by running `backup.sh`
4. Remove unnecessary users from `/etc/shadow` and `/etc/passwd`
5. Configure firewall!!!
   - Default deny
   - Configure firewall port and service specific
6. Config required ips
   - **At this point we should have services up and running**
7. Threat hunting: 
   - Update packages by running `pkgUpdate.sh`. **NOTE:** this script takes a while, so you want to use tmux and have this running in the background as you check for other threats
   - **Remove** malicious services by running `killALL.sh`
   - Look for redteam/malicious files by running `hunt.sh`
   - Check for any aliases by running `al.sh`
   - Look for suid (priveledge escalation) by runnning suid.sh
      - Use winpeas/linpeas for a more thorough check
   - Look for rootkits by using `rkhunter`
   - Look for payloads (Go/Sliver) by running `payload.sh`
8. Service hardening (tbh I'm not sure what this means)
9. Backup to backup server. **ANdrey will be handling this, let him know whenever you want to backup!**
