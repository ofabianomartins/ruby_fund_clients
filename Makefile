build:
	docker-compose build app test

up:
	docker-compose run --service-ports app

dev:
	docker-compose run app /bin/bash

rt:
	docker-compose run test /bin/bash

down:
	docker-compose down
