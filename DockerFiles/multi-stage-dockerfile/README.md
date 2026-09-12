# DockerFiles multi-stage Node.js app

This folder contains the original multi-stage Node.js example used by the DockerFiles assignment. The application uses Express and serves `Hello World from Docker multi-stage build` on port `8080`.

## Build and run

From the repository root:

```bash
docker build -t hello-multi-stage DockerFiles/multi-stage-dockerfile
docker run --rm --name hello-multi-stage-files -p 8080:8080 hello-multi-stage
```

Verify it:

```bash
curl -fsS http://localhost:8080/
```

Stop with `Ctrl+C`. The `--rm` flag removes the container.

## How the Dockerfile works

- The `builder` stage uses `node:24-alpine`, installs dependencies, and copies the application.
- The `production` stage starts from a fresh `node:24-alpine` image.
- The production stage installs only non-development dependencies and copies `server.js`.
- `package.json` defines the `npm start` command.

This is the assignment's original version. Compare it with [`Docker/multi-stage-app`](../../Docker/multi-stage-app/README.md) to see the newer example's layout and test script.
