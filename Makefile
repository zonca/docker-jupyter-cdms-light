build:
	docker build -t zonca/docker-jupyter-cdms-light:${VERSION} .

login:
	docker login

push:
	docker push zonca/docker-jupyter-cdms-light:${VERSION}

shell:
	docker run -it zonca/docker-jupyter-cdms-light:${VERSION} bash

tag:
	git tag -a ${VERSION} -m "Tag ${VERSION} in Github repository"
