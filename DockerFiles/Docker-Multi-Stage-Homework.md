# Docker Multi-Stage Build Homework

**Name:** Dhruv Soni

**Enrollment Number:** `[24BCS10205]`

## Task 1: Multi-stage Dockerfile

The application is in `multi-stage-dockerfile/` and uses separate `builder` and `production` stages. It serves on port `8080`.

### Build

```bash
docker build -t hello-multi-stage ./multi-stage-dockerfile
```

Observed result:

```text
#13 naming to docker.io/library/hello-multi-stage:latest done
```

### Run and verify the application

```bash
docker run -d --name hello-multi-stage-homework -p 8080:8080 hello-multi-stage
curl http://localhost:8080/
```

Observed output:

```text
<h1>Hello World from Docker multi-stage build</h1>
```

Open [http://localhost:8080](http://localhost:8080) in a browser to view the same message.

### Verify with `docker ps`

```bash
docker ps --filter name=hello-multi-stage-homework --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
```

Observed output:

```text
NAMES                        STATUS        PORTS
hello-multi-stage-homework   Up 1 second   0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp
```

## Task 3: Docker application deployments

The repository contains these independently runnable Docker applications:

| Application | Folder | Build command | Run command | Port |
|---|---|---|---|---:|
| Node.js multi-stage | `multi-stage-dockerfile` | `docker build -t hello-multi-stage ./multi-stage-dockerfile` | `docker run -d -p 8080:8080 hello-multi-stage` | 8080 |
| Python | `python-app` | `docker build -t hello-python ./python-app` | `docker run -d -p 8000:8000 hello-python` | 8000 |
| Java | `java-app` | `docker build -t hello-java ./java-app` | `docker run -d -p 8081:8081 hello-java` | 8081 |

Each application displays `Hello World` when its container is running.

Verified output:

```text
$ curl http://localhost:8000/
Hello World from Docker Python app
$ curl http://localhost:8081/
Hello World from Docker Java app
```

Running containers:

```text
NAMES                        STATUS              PORTS
hello-java-homework          Up                  0.0.0.0:8081->8081/tcp
hello-python-homework        Up                  0.0.0.0:8000->8000/tcp
hello-multi-stage-homework   Up                  0.0.0.0:8080->8080/tcp
```

## Cleanup

```bash
docker rm -f hello-multi-stage-homework hello-python-homework hello-java-homework
```
