FROM	debian:bullseye

RUN	apt update
RUN	apt install mariadb-server mariadb-client -y

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools/mariadb.sh /usr/local/bin/

RUN	chmod +x /usr/local/bin/mariadb.sh
RUN	./usr/local/bin/mariadb.sh
RUN	chown -R mysql:mysql /var/run/mysqld

ENTRYPOINT	["/usr/local/bin/mariadb.sh"]

CMD	["/usr/bin/mysqld_safe"]
