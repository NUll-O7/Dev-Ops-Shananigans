# DockerFiles Python app

This image runs [`app.py`](app.py), which uses Python's standard-library `HTTPServer` on container port `8000`.

## Build and run

```bash
docker build -t hello-python DockerFiles/python-app
docker run --rm --name hello-python-files -p 8000:8000 hello-python
```

Verify it:

```bash
curl -fsS http://localhost:8000/
```

The response is plain text: `Hello World from Docker Python app`. Stop with `Ctrl+C`; `--rm` removes the container.

The Dockerfile copies one Python source file into `python:3.12-alpine`, exposes port `8000`, and starts the file directly.
