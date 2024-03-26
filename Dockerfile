FROM	debian:bullseye

RUN	apt update && apt upgrade && apt install vim -y
# nginx
RUN	apt install nginx openssl -y
COPY	./conf/my.conf ./etc/nginx/conf.d/
RUN	mkdir /etc/nginx/ssl
RUN	openssl req -x509 -out /etc/nginx/ssl/ca.crt \ 
	-keyout /etc/nginx/ssl/private.key -nodes \ 
	-subj "/C=TH/ST=Bangkok/L=Ladkrabang/O=42BKK/OU=Cadet/CN=Prach/UID=truangsi"
RUN	rm -rf /etc/nginx/sites-enabled/default && rm -rf /etc/nginx/sites-available/default

# mariadb
RUN	apt install mariadb-server mariadb-client -y
COPY	./mariadb.sh /usr/local/bin/
RUN	chmod +x /usr/local/bin/mariadb.sh
RUN	/usr/local/bin/mariadb.sh



# php
RUN	apt install php php-mysql php-fpm -y

# wordpress
RUN	apt install wget -y
RUN	wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \ 
	tar -xzvf /tmp/wordpress.tar.gz -C /var/www/html && \
	chown -R www-data.www-data /var/www/html/wordpress && \
	chmod -R 755 /var/www/html/wordpress

#install wp-cli
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \	
    	chmod +x /usr/local/bin/wp

COPY	./wp_config.sh /usr/local/bin/
RUN	chmod +x /usr/local/bin/wp_config.sh
RUN	/usr/local/bin/wp_config.sh


# CMD	["/usr/local/bin/mariadb.sh"]

