#!/bin/sh
# chmod 755 virtualhost.sh
# ./virtualhost.sh gaudi antoni-gaudi
# sudo nano /etc/apache2/sites-available/000-default.conf


cat << EOF >> /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
    ServerName ${1}.com
    ServerAlias www.${1}.com

    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/${2}/public/
    # DirectoryIndex /index.php

    <Directory /var/www/html/${2}/public/>
        AllowOverride All
        Require all granted
        Order Allow,Deny

        # FallbackResource /index.php
    </Directory>

    <Directory /var/www/html/${2}>
        Opions FollowSymlinks
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF