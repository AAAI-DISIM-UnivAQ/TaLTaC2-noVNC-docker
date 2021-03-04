build:
	docker build -t TaLTaC2 .

run: build
	docker run --rm -p 18080:8080 TaLTaC2

shell: build
	docker run --rm -ti -p 18080:8080 TaLTaC2 bash
