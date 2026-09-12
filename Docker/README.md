# Docker Hello World Applications

Each folder is a separate Docker application:

| Folder | Port | Build | Run |
|---|---:|---|---|
| `nodejs-app` | 3000 | `docker build -t hello-node ./nodejs-app` | `docker run --rm -p 3000:3000 hello-node` |
| `python-app` | 8000 | `docker build -t hello-python ./python-app` | `docker run --rm -p 8000:8000 hello-python` |
| `java-app` | 8080 | `docker build -t hello-java ./java-app` | `docker run --rm -p 8080:8080 hello-java` |
| `Apache-app` | 8081 | `docker build -t hello-apache ./Apache-app` | `docker run --rm -p 8081:80 hello-apache` |
| `React-app` | 8082 | `docker build -t hello-react ./React-app` | `docker run --rm -p 8082:80 hello-react` |
| `nginx-app` | 8083 | `docker build -t hello-nginx ./nginx-app` | `docker run --rm -p 8083:80 hello-nginx` |

Open the matching `http://localhost:<port>` URL in a browser. Each page displays **Hello World**.
