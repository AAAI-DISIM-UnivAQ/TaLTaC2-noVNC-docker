all: build run

clean:
	docker rm --force taltac2; true
	docker image rm taltac2; true

build: clean
	docker build -t taltac2 .
	docker create -p 18080:8080 --name=taltac2 taltac2

run:
	docker start -a taltac2

shell:
	docker start taltac2; true
	docker exec taltac2 bash

