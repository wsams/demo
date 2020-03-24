# Demo

A minimal spring boot app for displaying Lorem Ipsum at http://localhost:8080/ - nothing else.

* [GitHub Project](https://github.com/wsams/demo)
* [Docker Hub](https://hub.docker.com/r/wsams/demo)

## Clone project

```
git clone git@github.com:wsams/demo.git

# OR

git clone https://github.com/wsams/demo.git
```

## Build the application

```
mvn clean package -DskipTests
```

## Build the image

```
docker build -t wsams/demo:latest --rm .
```

## Run directly with Maven

```
mvn spring-boot:run
```

View the index page at http://localhost:8080/

## Run with `java -jar`

```
java -jar target/demo-0.0.1-SNAPSHOT.jar
```

View the index page at http://localhost:8080/

## Start the web server with `docker`

```
docker run -it --rm -p 8080:8080 wsams/demo:latest
```

View an index page at http://localhost:8080/

## Start with Docker Compose

Create `docker-compose.yml`,

```
# docker-compose.yml
version: "3"
services:
  demo:
    container_name: demo
    image: wsams/demo:latest
    ports:
    - 8080:8080
```

Start the web server,

```
docker-compose up -d
```

View at http://locahost:8080/

## Deploy to Kubernetes

Create `deployment.yaml`.

```
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo
  labels:
    app: demo
spec:
  replicas: 1
  selector:
    matchLabels:
      app: demo
  template:
    metadata:
      labels:
        app: demo
    spec:
      containers:
      - name: demo
        image: wsams/demo:latest
        imagePullPolicy: Always
        ports:
        - containerPort: 8080
```

Apply,

```
kubectl apply -f deployment.yaml
```

Port forward to view index page,

```
kubectl port-forward deployment/demo 8080:8080
```

View at http://127.0.0.1:8080/
