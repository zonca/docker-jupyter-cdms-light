build:
	docker build -t zonca/docker-jupyter-cdms-light:${VERSION} .

push:
	docker login && docker push zonca/docker-jupyter-cdms-light:${VERSION}

shell:
	docker run -it zonca/docker-jupyter-cdms-light:${VERSION} bash
