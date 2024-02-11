# Docker起動

```shell
# docker build
docker system prune -f
docker build -t myorg/myapp .
 
# docker run
docker run -p 8080:8080 -t myorg/myapp
```
