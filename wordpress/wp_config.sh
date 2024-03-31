#!/bin/bash

if [ ! -e "/var/www/html/wordpress/wp-config.php" ]
then
	cd /var/www/html/wordpress
	
	#service nginx start
	#service mariadb start
	#service php7.4-fpm start

	#echo ">>>>>>>>>here<<<<<<<<<<<"
	cp wp-config-sample.php wp-config.php

	# Init Wordpress Databases
	sed -i "s/database_name_here/wordpress/g" wp-config.php
	sed -i "s/username_here/wordpress_user/g" wp-config.php
	sed -i "s/password_here/1234/g" wp-config.php
	sed -i "s/localhost/mariadb/g" wp-config.php
	#wp config create --allow-root \
	#	--dbname=wordpress \
	#	--dbuser=wordpress_user \
	#	--dbpass=1234 \
	#	--dbhost=localhost
	#echo ">>>>>>>>>here<<<<<<<<<<<"

	#sleep 10	
	wp core install --allow-root \
		--url=truangsi.42.fr \
		--title=myWordpress \
		--admin_user=truangsi \
		--admin_password=1234 \
		--admin_email=thanagorn1116@gmail.com

fi
exec "$@"
