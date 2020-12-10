.PHONY: init
init:
		rm -rf ./app/*
		rm -rf ./app/.gitkeep
		rm -rf ./db/mysql_data/*
		rm -rf ./ssl/*
		rm -rf ./logs/*
		$(MAKE) build
		$(MAKE) up

.PHONY: build
build:
		docker-compose build --no-cache

.PHONY: up
up:
		docker-compose up -d

.PHONY: down
down:
		docker-compose down

.PHONY: start
start:
		docker-compose start

.PHONY: stop
stop:
		docker-compose stop


