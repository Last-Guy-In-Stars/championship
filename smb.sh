# Get creds
smbclient -N -L \\\\10.129.42.253
# Connection
smbclient \\\\10.129.42.253\\users
ls