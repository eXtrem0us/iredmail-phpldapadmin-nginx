#!/bin/bash
#
#	It is assumed that you have installed iRedMail and phpLDAPAdmin
#


rsync -a ./etc/ /etc/
echo 'location ~ ^/phpldapadmin { rewrite ^ https://$host$request_uri?; }' >> /etc/nginx/templates/redirect_to_https.tmpl
sed -i 's/ldaps\:\/\/localhost/localhost/g' /etc/phpldapadmin/config.php
sed -i 's/686/389/g' /etc/phpldapadmin/config.php
