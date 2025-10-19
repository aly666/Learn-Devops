# syntax=docker/dockerfile:1.4
# Stage 1: Builder
FROM node:20 AS builder

WORKDIR /app

# ARG untuk environment (opsional)
ARG NODE_ENV=production
ENV NODE_ENV=$NODE_ENV

# Salin package files dan install dependencies dengan cache BuildKit
COPY package*.json ./
RUN --mount=type=cache,target=/root/.npm \
    npm install

# Salin semua source code
COPY . .

# Build aplikasi
RUN --mount=type=tmpfs,target=/app/tmp npm run build

# Stage 2: Production
FROM node:20-alpine AS production

# Buat non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Salin file penting dari builder
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/server.js ./server.js

# Jalankan sebagai non-root user
USER appuser

# Expose port
EXPOSE 3000

# Healthcheck
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:3000/ || exit 1

# Start aplikasi
CMD ["npm", "start"]

