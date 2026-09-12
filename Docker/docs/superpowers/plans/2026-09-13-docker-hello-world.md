# Docker Hello World Applications Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create six small Dockerized Hello World web applications in the requested folders.

**Architecture:** Each folder is independently buildable and runnable. Runtime examples use standard-library servers where possible; static examples use official Apache/Nginx images. A root README provides the exact commands and ports.

**Tech Stack:** Docker, Node.js, Python, Java, Apache HTTP Server, Nginx, React-compatible browser JavaScript.

**Spec:** `docs/superpowers/specs/2026-09-13-docker-hello-world-design.md`

## Global Constraints

- Keep the exact folder names: `nodejs-app`, `python-app`, `java-app`, `Apache-app`, `React-app`, `nginx-app`.
- Every application folder contains a `Dockerfile`.
- Every application must serve a webpage containing `Hello World`.
- Do not add an external dependency when the base runtime or web server already provides the needed behavior.

---

### Task 1: Add Node.js and Python applications

**Files:**
- Create: `nodejs-app/server.js`
- Create: `nodejs-app/Dockerfile`
- Create: `python-app/app.py`
- Create: `python-app/Dockerfile`

- [ ] **Step 1: Add the minimal HTTP handlers**

Node.js listens on port 3000 and returns an HTML Hello World page. Python listens on port 8000 and serves the same response from `/`.

- [ ] **Step 2: Add Dockerfiles**

Use official runtime images, copy the single source file, expose the application port, and run the source file directly.

- [ ] **Step 3: Build and smoke-test both images**

Run `docker build -t hello-node ./nodejs-app` and `docker build -t hello-python ./python-app`; start each container on its documented host port and verify with `curl`.

### Task 2: Add Java application

**Files:**
- Create: `java-app/HelloWorld.java`
- Create: `java-app/Dockerfile`

- [ ] **Step 1: Add the JDK HTTP server**

Implement one class with `main`, bind port 8080, return an HTML Hello World response, and stop the server cleanly on process termination.

- [ ] **Step 2: Compile in the Docker build**

Use an official JDK image to compile the class, then run it with the same image to keep the Dockerfile short.

- [ ] **Step 3: Build and smoke-test**

Run `docker build -t hello-java ./java-app`, start it on host port 8080, and verify the response with `curl`.

### Task 3: Add Apache, React, and Nginx applications

**Files:**
- Create or modify: `Apache-app/index.html`
- Create or modify: `Apache-app/Dockerfile`
- Create or modify: `React-app/index.html`
- Create or modify: `React-app/Dockerfile`
- Modify: `nginx-app/index.html`
- Modify: `nginx-app/Dockerfile`

- [ ] **Step 1: Add static Hello World pages**

Use one simple HTML page per folder. The React page renders its message through a small React-compatible component loaded from a browser CDN, while Apache and Nginx serve plain HTML.

- [ ] **Step 2: Add official web-server Dockerfiles**

Copy each page into the default document root of the relevant official image. The React app uses Nginx to serve the static page after its browser-side render.

- [ ] **Step 3: Build and smoke-test all three images**

Build each image, run it on a unique host port, and verify that the response contains `Hello World`.

### Task 4: Document usage

**Files:**
- Create or modify: `README.md`

- [ ] **Step 1: Document folder layout and commands**

List each folder, build command, run command, and browser URL.

- [ ] **Step 2: Run a final repository check**

Confirm all six folders have Dockerfiles and source files, then rebuild and smoke-test any image not already verified.
