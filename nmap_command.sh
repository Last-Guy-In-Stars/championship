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