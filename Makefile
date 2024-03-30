VOLUME_DIR = /home/ubuntu/data

all: create up

create:
	sudo mkdir -p ${VOLUME_DIR}/wordpress
	sudo mkdir -p ${VOLUME_DIR}/mariadb

up:
	docker compose -f ./docker-compose.yml up -d --build

down:
	docker compose -f ./docker-compose.yml down

start:
	docker compose -f ./docker-compose.yml start

stop:
	docker compose -f ./docker-compose.yml stop

re: down up

clean:
	docker compose -f ./docker-compose.yml down --rmi all --volumes

fclean:
	docker stop $$(docker ps -qa) 
	docker system prune --all --force
	docker network prune --force
	docker volume prune --force

.PHONY : all create up down start stop re clean fclean
