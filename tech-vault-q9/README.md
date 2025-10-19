# Dockerfile untuk Aplikasi Node.js

## Langkah-langkah Build dan Run
1. Build image:
   ```bash
   docker build -t my-node-app .

2. docker run -p 3000:3000 my-node-app

# Dockerfile BuildKit-Optimized

## Build Image
Aktifkan BuildKit dan build image:

```bash
export DOCKER_BUILDKIT=1
docker build -t my-node-app .
docker run -p 3000:3000 my-node-app

