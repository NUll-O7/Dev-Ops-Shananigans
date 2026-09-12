#!/bin/sh
set -eu

image=hello-multi-stage
container=$(docker run -d -p 8080:8080 "$image")
trap 'docker rm -f "$container" >/dev/null 2>&1 || true' EXIT
sleep 1
curl -fsS http://127.0.0.1:8080/ | grep -q 'Hello World from Docker multi-stage build'
docker ps --filter "id=$container" --format '{{.Ports}}' | grep -q '8080'
