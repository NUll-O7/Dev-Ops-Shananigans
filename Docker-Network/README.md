# Docker Networking and Volumes Homework

This README contains the commands and verification results for the Docker networking and volume exercises.

## Prerequisites

- Docker Engine is running.
- Ports `80` and `8080` are available.

## Task 1: Container networking

Create three networks. The frontend and backend share `frontend-net`; the backend and database share `db-net`; `shared-net` lets the frontend and database communicate directly for the third-network check.

```bash
docker network create frontend-net
docker network create db-net
docker network create shared-net

docker run -d --name homework-frontend --network frontend-net nginx:alpine
docker run -d --name homework-backend --network frontend-net alpine:3.20 \
  sh -c 'while :; do sleep 3600; done'
docker network connect db-net homework-backend

docker run -d --name homework-database --network db-net \
  -e MYSQL_ROOT_PASSWORD=homework mysql:8.4
docker network connect shared-net homework-frontend
docker network connect shared-net homework-database
```

The backend is attached to two networks:

```bash
docker inspect -f '{{json .NetworkSettings.Networks}}' homework-backend
```

Check name resolution and connectivity from the frontend and backend containers:

```bash
docker exec homework-frontend ping -c 1 homework-backend
docker exec homework-frontend ping -c 1 homework-database
docker exec homework-backend ping -c 1 homework-frontend
docker exec homework-backend ping -c 1 homework-database
```

Expected result: each command ends with `1 packets transmitted, 1 packets received`.

Cleanup:

```bash
docker rm -f homework-frontend homework-backend homework-database
docker network rm frontend-net db-net shared-net
```

## Task 2: Host network

The official Apache HTTP Server image is `httpd` on Docker Hub.

```bash
docker pull httpd:2.4
docker run -d --name homework-apache --network host httpd:2.4
curl http://localhost:80
```

The response contains the Apache test page. With host networking, Apache binds directly to the host's port `80`; there is no Docker port mapping.

Cleanup:

```bash
docker rm -f homework-apache
```

## Task 3: Bind mount

The fixture for this task is [`site/index.html`](site/index.html).

```bash
docker run -d --name homework-nginx \
  -p 8080:80 \
  --mount type=bind,src="$PWD/site",dst=/usr/share/nginx/html,readonly \
  nginx:alpine

curl http://localhost:8080
```

The response contains `Hello students`.

Modify the host file while the container is running:

```bash
printf 'Hello students - updated\n' > site/index.html
curl http://localhost:8080
```

The updated response appears without restarting the container because the file is bind-mounted from the host.

Cleanup:

```bash
docker rm -f homework-nginx
```

## Task 4: Overlay networks

An overlay network connects containers running on different Docker hosts. Docker Swarm provides the control plane and distributes the network configuration to participating nodes. Containers on the same overlay network can communicate by service or container name while Docker handles the cross-host routing. See the [Docker overlay network documentation](https://docs.docker.com/engine/network/drivers/overlay/).

Use overlay networks when a workload is distributed across multiple Docker hosts, such as a Swarm service. A normal bridge network is local to one Docker host, so it cannot provide this cross-host connectivity.

Run this only on a disposable Docker Swarm manager. The participating hosts must allow TCP `2377`, TCP/UDP `7946`, and UDP `4789` between them:

```bash
docker swarm init
docker network create --driver overlay --attachable homework-overlay
docker service create --name homework-web --network homework-overlay nginx:alpine
docker service ls
docker network inspect homework-overlay
```

Join another Docker host to the Swarm with the worker command printed by `docker swarm init`, then scale the service to test placement across hosts:

```bash
docker service scale homework-web=2
docker service ps homework-web
```

The overlay network is created with the `--driver overlay` flag. Swarm nodes exchange the network metadata, and Docker provides the encapsulated cross-host traffic. Remove the lab when finished:

```bash
docker service rm homework-web
docker network rm homework-overlay
docker swarm leave --force
```

## Verification record

Docker Engine `29.7.2` is available locally. The checks passed for:

- Task 1: frontend/backend/database connectivity across the three networks.
- Task 2: Apache served successfully through host port `80`.
- Task 3: the updated bind-mounted file was served without restarting Nginx.

Overlay verification requires a Docker Swarm and, for the cross-host behavior, at least two Docker hosts.

Screenshots should be captured after running each task and added below:
