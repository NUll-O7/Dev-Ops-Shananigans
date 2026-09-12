# Docker examples

This directory contains small, independently buildable web containers. Every example serves a Hello World page, but the runtime or image layout changes between folders so you can compare the trade-offs.

## Examples

| Directory | What it demonstrates | Container port | Host port in the example |
|---|---|---:|---:|
| [`nodejs-app`](nodejs-app/README.md) | Node.js `http` module | 3000 | 3000 |
| [`python-app`](python-app/README.md) | Python standard-library HTTP server | 8000 | 8000 |
| [`java-app`](java-app/README.md) | JDK `HttpServer` API | 8080 | 8080 |
| [`Apache-app`](Apache-app/README.md) | Static HTML with Apache HTTP Server | 80 | 8081 |
| [`React-app`](React-app/README.md) | React 18 browser render served by Nginx | 80 | 8082 |
| [`nginx-app`](nginx-app/README.md) | Static HTML with Nginx | 80 | 8083 |
| [`multi-stage-app`](multi-stage-app/README.md) | Express app with builder and production stages | 8080 | 8080 |

## Prerequisites

- Docker Engine or Docker Desktop is running.
- The host ports you use are free.
- `curl` is available for verification.

## Build and run

Build from the repository root:

```bash
docker build -t hello-node Docker/nodejs-app
docker run --rm -p 3000:3000 hello-node
```

In another terminal:

```bash
curl -fsS http://localhost:3000/
```

The other standalone examples use the same pattern:

```bash
docker build -t hello-python Docker/python-app
docker run --rm -p 8000:8000 hello-python

docker build -t hello-java Docker/java-app
docker run --rm -p 8080:8080 hello-java

docker build -t hello-apache Docker/Apache-app
docker run --rm -p 8081:80 hello-apache

docker build -t hello-react Docker/React-app
docker run --rm -p 8082:80 hello-react

docker build -t hello-nginx Docker/nginx-app
docker run --rm -p 8083:80 hello-nginx
```

Open the matching `http://localhost:<host-port>` URL or use `curl`. Stop a foreground container with `Ctrl+C`; `--rm` removes it after it stops.

## Multi-stage example

The Express example has its own smoke test:

```bash
docker build -t hello-multi-stage Docker/multi-stage-app
(cd Docker/multi-stage-app && ./test.sh)
```

The test starts a temporary container on port `8080`, checks the response, checks the published port, and removes the container with a shell trap. Make sure port `8080` is free before running it.

## How the Dockerfiles differ

- The Node.js, Python, and Java examples copy source into a runtime image and start it directly.
- Apache and Nginx copy a static page into the server's document root.
- The React example is a static page that loads React and ReactDOM from a browser CDN. It is not a bundled production React build.
- The multi-stage example installs dependencies in a builder stage and creates a separate production stage.

## Troubleshooting

- `port is already allocated`: stop the process or container using that host port, or choose another host port such as `-p 3001:3000`.
- A build uses stale files: rebuild with `docker build --no-cache ...` only when needed.
- A container exits immediately: run it without `--rm`, inspect `docker logs <container>`, then remove it after debugging.
- The React page is blank offline: the browser cannot download its CDN scripts. The page requires network access at render time.

Related practice: [`Docker-Network/README.md`](../Docker-Network/README.md) covers connectivity, host networking, and bind mounts.
