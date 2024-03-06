# **Ubuntu Machine as DNS server on the local network**
1. Edit the 'etc/resolv.conf' file on internal Kali Device: use 'sudo nano /etc/resolv.conf'
2. Add the 'nameserver 192.168.<team_number>.2' line at the end
## Configuring the Server to Resolve the Scoreboard
**On the Server (Ubuntu Machine):** 'cd /etc/bind'
1. run 'sudo nano zones/forward.<domainname>'
  - **_change serial number_**
2. Below existing rules, write '<subdomain>     IN A    <scoreboard ip address>'
3. 'sudo systemctl restart named'
4. use 'nslookup <subdomain.domain>'
  - Should return: '''Name:   <subdomain.domain>
                  Address: <scoreboard ip address>'''
