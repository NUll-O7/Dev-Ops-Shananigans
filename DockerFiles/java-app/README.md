# DockerFiles Java app

This image compiles [`Main.java`](Main.java) with `eclipse-temurin:21-jdk-alpine` and starts the resulting class on container port `8081`.

## Build and run

```bash
docker build -t hello-java DockerFiles/java-app
docker run --rm --name hello-java-files -p 8081:8081 hello-java
```

Verify it:

```bash
curl -fsS http://localhost:8081/
```

The response is plain text: `Hello World from Docker Java app`. Stop with `Ctrl+C`; `--rm` removes the container.

The Dockerfile compiles `Main.java` during the build and uses `java Main` as the default command.
