from flask import Flask
import redis
import os

app = Flask(__name__)

# Ambil konfigurasi dari environment
REDIS_HOST = os.environ.get("REDIS_HOST", "redis")
REDIS_PORT = int(os.environ.get("REDIS_PORT", 6379))

r = redis.Redis(host=REDIS_HOST, port=REDIS_PORT)

@app.route("/")
def index():
    try:
        r.ping()
        return "Flask API connected to Redis!", 200
    except redis.exceptions.ConnectionError:
        return "Redis connection failed!", 500

@app.route("/health")
def health():
    return "OK", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

