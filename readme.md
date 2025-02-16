Install
```
pip install pre-commit
pre-commit install
```


Build docker image
```
docker build --build-arg REPO_URL=<github-repo-url> -t <docker-image-name> .
```

Run container 
```
docker run --name <docker-container-name> -it <docker-image-name>
```