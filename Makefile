build:
	docker-compose build app test

up:
	docker-compose run --rm --service-ports app

dev:
	docker-compose run --rm app /bin/bash

rt:
	docker-compose run --rm test /bin/bash

down:
	docker-compose down
