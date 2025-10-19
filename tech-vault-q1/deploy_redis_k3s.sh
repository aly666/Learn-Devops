#!/bin/bash

set -e

NAMESPACE="cyberco"

echo "🚀 Membuat namespace jika belum ada..."
sudo k3s kubectl get ns $NAMESPACE >/dev/null 2>&1 || sudo k3s kubectl create ns $NAMESPACE

echo "📦 Membuat Deployment Redis..."
sudo k3s kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: cache-db
  namespace: ${NAMESPACE}
spec:
  replicas: 2
  selector:
    matchLabels:
      app: cache-db
  template:
    metadata:
      labels:
        app: cache-db
    spec:
      containers:
        - name: redis
          image: redis:buster
          ports:
            - containerPort: 6379
EOF

echo "🔗 Membuat Service Redis..."
sudo k3s kubectl apply -f - <<EOF
apiVersion: v1
kind: Service
metadata:
  name: cache-db
  namespace: ${NAMESPACE}
spec:
  selector:
    app: cache-db
  ports:
    - port: 6379
      targetPort: 6379
      protocol: TCP
      name: redis
  type: ClusterIP
EOF

echo "⏳ Menunggu Pod Redis siap..."
sudo k3s kubectl wait --for=condition=available deployment/cache-db -n ${NAMESPACE} --timeout=60s

echo "🧪 Menjalankan test koneksi Redis..."
sudo k3s kubectl run test-redis -n ${NAMESPACE} --rm -it --image=redis:alpine --restart=Never -- ash -c "redis-cli -h cache-db -p 6379 ping" || true

echo "✅ Selesai! Redis sudah jalan di namespace '${NAMESPACE}'."

