# Bind-mount fixture

[`index.html`](index.html) is the host-side fixture for Task 3 in [`../README.md`](../README.md).

The exercise mounts this directory at `/usr/share/nginx/html` with a read-only bind mount:

```bash
docker run -d --name homework-nginx \
  -p 8080:80 \
  --mount type=bind,src="$PWD/site",dst=/usr/share/nginx/html,readonly \
  nginx:alpine
```

Edit `index.html` on the host and request `http://localhost:8080` again. The running container serves the new content because it reads the mounted file directly.

The fixture is intentionally plain text so the file change is obvious. Restore it to `Hello students` after experimenting.
