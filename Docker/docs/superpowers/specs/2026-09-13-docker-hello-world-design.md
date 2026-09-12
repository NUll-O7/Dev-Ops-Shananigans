# Docker Hello World Applications

## Goal

Provide six independently runnable Docker examples that display Hello World in a browser and preserve the requested folder names.

## Design

- `nodejs-app`: Node.js HTTP server using the already-standard `http` module.
- `python-app`: Python HTTP server using `http.server`.
- `java-app`: Java HTTP server using the JDK HTTP server API.
- `Apache-app`: static HTML served by the official Apache image.
- `React-app`: minimal React page built with a lightweight local static setup and served by Nginx.
- `nginx-app`: static HTML served by the official Nginx image.

Each directory contains only the source files and Dockerfile needed for its image. The root README documents build, run, and browser verification commands. No application-wide orchestration or extra dependencies are added.

## Verification

Build each image with `docker build`, run it on a unique localhost port, and use `curl` to confirm the response contains `Hello World`.
