python -c 'import pty; pty.spawn("/bin/bash")'
-------------------
www-data@remotehost$ ^Z

Giflop@htb[/htb]$ stty raw -echo
Giflop@htb[/htb]$ fg

[Enter]
[Enter]
www-data@remotehost$
-------------------
Giflop@htb[/htb]$ echo $TERM

xterm-256color
-------------------
Giflop@htb[/htb]$ stty size

67 318
-------------------
www-data@remotehost$ export TERM=xterm-256color

www-data@remotehost$ stty rows 67 columns 318