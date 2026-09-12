# Multi-stage Node.js container

This example runs a small Express application on port `8080` and uses two Docker stages:

- `builder` installs the declared dependencies and copies the source.
- `production` starts from a fresh Node.js image, installs production dependencies, and copies only the files needed to run.

## Build and run

```bash
docker build -t hello-multi-stage Docker/multi-stage-app
docker run --rm --name hello-multi-stage -p 8080:8080 hello-multi-stage
```

Verify it:

```bash
curl -fsS http://localhost:8080/
```

Expected response:

```text
<h1>Hello World from Docker multi-stage build</h1>
```

## Smoke test

With port `8080` free, run the checked-in test from the repository root:

```bash
(cd Docker/multi-stage-app && ./test.sh)
```

The script starts a temporary container, checks the response with `curl`, confirms port `8080` is published, and removes the container on exit.

## Why the stages matter

The stages make the build boundary visible and leave the final image with the runtime files rather than the builder's whole working directory. The example still installs dependencies in the final stage and uses a small app so the Dockerfile stays readable.
