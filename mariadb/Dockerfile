FROM	debian:bullseye

RUN	apt update && apt upgrade && apt install vim -y
RUN	apt install mariadb-server mariadb-client -y

COPY	./50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./mariadb.sh /usr/local/bin/

RUN	chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT	["/usr/local/bin/mariadb.sh"]

CMD	["/usr/bin/mysqld_safe"]
