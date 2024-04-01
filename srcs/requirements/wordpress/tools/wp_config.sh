#!/bin/bash

if [ ! -e "/var/www/html/wordpress/wp-config.php" ]
then
	cd /var/www/html/wordpress
	
	cp wp-config-sample.php wp-config.php

	# Init Wordpress Databases
	sed -i "s/database_name_here/${DB_NAME}/g" wp-config.php
	sed -i "s/username_here/${DB_USER}/g" wp-config.php
	sed -i "s/password_here/${DB_PASSWORD}/g" wp-config.php
	sed -i "s/localhost/${DB_HOSTNAME}/g" wp-config.php

	sleep 10
	# create admin user
	wp core install --allow-root \
		--url=${DOMAIN_NAME} \
		--title=${WP_TITLE} \
		--admin_user=${ADMIN_USER} \
		--admin_password=${ADMIN_PASS} \
		--admin_email=${ADMIN_EMAIL}

	# create normal user
	wp user create ${MYUSER} \
		${MYUSER_EMAIL} \
		--role=${MYUSER_ROLE} \
		--user_pass=${MYUSER_PASS} \
		--display_name=${DISPLAY_NAME} \
		--allow-root

fi

chmod -R 777 /var/www/html/   
exec "$@"
