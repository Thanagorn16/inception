#!/bin/bash

service mariadb start

if [ ! -d "/var/lib/mysql/wordpress" ]
then
	# Secure Databases
	echo -e "\nY\nY\n'1234'\n'1234'\nY\nY\nY\nY" | mysql_secure_installation

	# Init Databases
	mariadb -e "CREATE DATABASE IF NOT EXISTS \`wordpress\`;"
	mariadb -e "CREATE USER IF NOT EXISTS \`wordpress_user\`@'%' IDENTIFIED BY '1234';"
	mariadb -e "GRANT ALL PRIVILEGES ON \`wordpress\`.* TO \`wordpress_user\`@'%' IDENTIFIED BY '1234';"
	mariadb -e "FLUSH PRIVILEGES;"
fi

service mariadb stop

exec "$@"