build:
	docker build -t zonca/docker-jupyter-cdms-light:${VERSION} .

push:
	docker push zonca/docker-jupyter-cdms-light:${VERSION}
