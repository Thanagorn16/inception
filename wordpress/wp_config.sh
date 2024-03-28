if [ ! -e "/var/www/html/wordpress/wp-config.php" ]
then
	cd /var/www/html/wordpress
	
	service nginx start
	service mariadb start
	service php7.4-fpm start

	wp config create --allow-root \
		--dbname=wordpress \
		--dbuser=wordpress_user \
		--dbpass=1234 \
		--dbhost=localhost
	
	wp core install --allow-root \
		--url=truangsi.42.fr \
		--title=myWordpress \
		--admin_user=truangsi \
		--admin_password=1234 \
		--admin_email=thanagorn1116@gmail.com

fi

