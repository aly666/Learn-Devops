# Gunakan image Python 3.11
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements dan install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Jalankan aplikasi Flask
CMD ["python", "app.py"]

