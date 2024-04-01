FROM	debian:bullseye

RUN	apt update && apt install vim -y
# nginx
RUN	apt install nginx openssl -y
COPY	./conf/my.conf ./etc/nginx/conf.d/
RUN	mkdir /etc/nginx/ssl && \
	openssl req -x509 -out /etc/nginx/ssl/ca.crt \ 
	-keyout /etc/nginx/ssl/private.key -nodes \ 
	-subj "/C=TH/ST=Bangkok/L=Ladkrabang/O=42BKK/OU=Cadet/CN=Prach/UID=truangsi"
RUN	rm -rf /etc/nginx/sites-enabled/default && rm -rf /etc/nginx/sites-available/default

CMD	["nginx", "-g", "daemon off;" ]
