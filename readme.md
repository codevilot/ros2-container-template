Install
```
pip install pre-commit
pre-commit install
```


## Build docker image
```
docker build \
  --build-arg WORK_DIR=<container-work-dir> \
  -t <docker-image-name> .
```


## Run container 
```
docker run -v `pwd`:/<container-work-dir> -it --name <docker-container-name> <docker-image-name> /bin/sh
```

## Set precommit python dependency
```w
pip3 install pipreqs pre-commit
pre-commit install
```

## Full code
```
export WORK_DIR = <container-work-dir> # binding to work dir and this repository
export DOCKER_IMAGE_NAME = <docker-image-name>
export DOCKER_CONTAINER_NAME = <docker-container-name>

docker build \
  --build-arg WORK_DIR=${WORK_DIR} \
  -t ${DOCKER_IMAGE_NAME} .

docker run -v `pwd`:/${WORK_DIR} -it --name ${DOCKER_CONTAINER_NAME} ${DOCKER_IMAGE_NAME} /bin/sh
```

