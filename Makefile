build:
	docker build -t taltac2 .

run: build
	docker run --rm -p 18080:8080 taltac2

shell: build
	docker run --rm -ti -p 18080:8080 taltac2 bash
