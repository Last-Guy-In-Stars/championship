########################SAVES######################
Normal output (-oN) with the .nmap file extension
Grepable output (-oG) with the .gnmap file extension
XML output (-oX) with the .xml file extension
########################SAVES######################

########################Some interesed information#
#--------
Linux/Mac: The default TTL value is typically, 64
Windows: The default TTL value is usually 128,
#--------
########################Some interesed information#

nmap -p0- -v -A -T4 'host'
nmap -sV -sC -p- 10.129.42.253
## Place nmap default scripts in path: /usr/share/nmap/scripts
#Banner Grabbing
nmap -sV --script=banner -p21 10.10.10.0/24.
# SMB
nmap --script smb-os-discovery.nse -p445 10.10.10.40
# FTP
nmap -sC -sV -p21 10.129.42.253
# Search cve on machine
nmap --script vuln -sV host
# Only open ports describe and display
nmap -sV --open -oA nibbles_initial_scan 10.129.42.190
# Check single port
nc -nv 10.129.42.190 80
# Scan multiple IP
nmap -sn -oA tnet 10.129.2.18 10.129.2.19 10.129.2.20| grep for | cut -d" " -f5
# Check alive host or not
nmap 10.129.2.18 -sn -oA host -PE --packet-trace 
# Disable ARP ping
nmap 10.129.2.18 -sn -oA host -PE --packet-trace --disable-arp-ping
# Scaned HTTPS port 443
nmap 10.129.2.28 -p 443 --packet-trace --disable-arp-ping -Pn -n --reason -sT 
# Scan filtered port: -Pn Disables ICMP Echo requests. -n Disable DNS check resolution
nmap 10.129.2.28 -p 139 --packet-trace -n --disable-arp-ping -Pn
# Scan UDP port: --reason display a status port 
nmap 10.129.2.28 -F -sU
nmap 10.129.2.28 -sU -Pn -n --disable-arp-ping --packet-trace -p 137 --reason
# Show version 
nmap '' -sV
