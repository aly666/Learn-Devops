# Stage 1: Build dependencies
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt  # install global, bukan --user

# Stage 2: Runtime
FROM python:3.12-slim
WORKDIR /app

# Copy dependencies global dari builder
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Copy source code
COPY . .

# Non-root user
RUN useradd -m appuser
USER appuser

EXPOSE 5000
CMD ["python", "app.py"]

