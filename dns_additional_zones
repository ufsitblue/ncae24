# **Ubuntu Machine as DNS server on the local network**
Edit the 'etc/resolv.conf' file on internal Kali Device: use 'sudo nano /etc/resolv.conf'
add the 'nameserver 192.168.<team_number>.2' line at the end
## Configuring the Server to Resolve the Scoreboard
**On the Server (Ubuntu Machine):** 'cd /etc/bind'
run 'sudo nano zones/forward.<domainname>'
**_change serial number_**
Below existing rules, write '<subdomain>     IN A    <scoreboard ip address>'
'sudo systemctl restart named'
use 'nslookup <subdomain.domain>'
Should return: '''Name:   <subdomain.domain>
                  Address: <scoreboard ip address>'''
