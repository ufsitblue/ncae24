# Basic UFW Rules
Make sure you put these in order from top to bottom as the order does matter. Doing otherwise could allow some connections to make it past our system, and if you want to check the order of rules, you can do 
`sudo ufw status numbered`

These allow us to SSH into the machine.
```
sudo ufw allow from <IP WHERE WE SSH FROM> to any port 22 proto tcp
sudo ufw allow out 22/tcp
```

Use these if connection to web server is required.
```
sudo ufw allow from <WEB IP> to any port 80 proto tcp
sudo ufw allow out 80/tcp
```
These are for if DNS requests are required
```
sudo ufw allow from <DNS IP> to any port 53 proto udp
sudo ufw allow out 53/udp
```
These are just safety defaults to minimize unnecessary outgoing/incoming traffic.
```
sudo ufw default deny incoming
sudo ufw default deny outgoing
```
These can help us find if there are errors in how the firewall is setup or if connections are being interfered.
```
sudo ufw logging on
sudo ufw logging high
```
Once you do all of the above (Don't forget SSH rules!) then enable.
```
sudo ufw enable
```
