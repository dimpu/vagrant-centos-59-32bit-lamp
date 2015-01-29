#!/usr/bin/env bash
block="<VirtualHost *>
	ServerAdmin webmaster@$1
	ServerName  $1
	ServerAlias www.$1 
	#DirectoryIndex index.html
	DocumentRoot $2
	ErrorLog  $2/error.log
	CustomLog $2/access.log combined
</VirtualHost>
"
echo "$block">"/etc/httpd/sites/$1.conf";
sudo /sbin/service httpd restart