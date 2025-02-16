Install
```
pip install pre-commit
pre-commit install
```


Build public repository docker image 
```
docker build \
  --build-arg WORK_DIR=<container-work-dir> \
  --build-arg REPO_URL=<github-repo-url> \
  --build-arg GIT_NAME=<your-git-name> \
  --build-arg GIT_EMAIL=<your-git-email> \
  -t <docker-image-name> .
```

Build private repository docker image
```
docker build \
  --build-arg WORK_DIR=<container-work-dir> \
  --build-arg REPO_URL=<github-repo-url> \
  --build-arg GIT_NAME=<your-git-name> \
  --build-arg GIT_EMAIL=<your-git-email> \
  --build-arg GIT_PRIVATE_TOKEN=<your-private-token> \
  -t <docker-image-name> .
```


Run container 
```
docker run --name <docker-container-name> -it <docker-image-name>
```