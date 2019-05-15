#!/bin/bash

#
# This script configures WordPress file permissions based on recommendations
# from http://codex.wordpress.org/Hardening_WordPress#File_permissions
#
# Author: Michael Conigliaro (https://gist.github.com/macbleser/9136424)
#
# This script is borrow from https://gist.github.com/macbleser/9136424
WP_OWNER=$(id -u $(logname)) # <-- WordPress Owner
WP_GROUP=$(id -g $(logname)) # <-- WordPress Group
WP_ROOT=/var/www/html # <-- WordPress Directory
WS_GROUP=www-data # <-- Web Server Group
 
echo "Fixing permissions on $WP_ROOT"
echo "Wordpress owner.group: $WP_OWNER.$WP_GROUP"
echo "Web Server group: $WS_GROUP"

echo 'Reset to safe defaults'
find ${WP_ROOT} -exec chown ${WP_OWNER}:${WP_GROUP} {} \;
find ${WP_ROOT} -type d -exec chmod 755 {} \;
find ${WP_ROOT} -type f -exec chmod 644 {} \;
 
echo 'Allow wordpress to manage wp-config.php (but prevent world access)'
chgrp ${WS_GROUP} ${WP_ROOT}/wp-config.php
chmod 660 ${WP_ROOT}/wp-config.php
 
echo 'Allow wordpress to manage .htaccess'
touch ${WP_ROOT}/.htaccess
chgrp ${WS_GROUP} ${WP_ROOT}/.htaccess
chmod 664 ${WP_ROOT}/.htaccess
 
echo 'Allow wordpress to manage wp-content'
find ${WP_ROOT}/wp-content -exec chgrp ${WS_GROUP} {} \;
find ${WP_ROOT}/wp-content -type d -exec chmod 775 {} \;
find ${WP_ROOT}/wp-content -type f -exec chmod 664 {} \;
