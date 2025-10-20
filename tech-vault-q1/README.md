Penjelasan singkat:

- Membuat Namespace cyberco.

- Membuat Deployment cache-db di namespace CyberCo.

- Image redis:buster dipakai.

- replicas: 2 membuat 2 pod.

- containerPort: 6379 membuka port 6379 pada container.



STEP 1 
sudo mkdir -p /home/aly/Learn-Devops/tech-vault-q1
sudo tee /home/aly/Learn-Devops/tech-vault-q1/special-definition.yml > /dev/null <<EOF
# Namespace cyberco
apiVersion: v1
kind: Namespace
metadata:
  name: cyberco
---
# Deployment Redis
apiVersion: apps/v1
kind: Deployment
metadata:
  name: cache-db
  namespace: cyberco
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

STEP 2
buat alias dp='kubectl apply -f'
dp /home/aly/Learn-Devops/tech-vault-q1/special-definition.yml


kubectl get ns
kubectl get deployments -n CyberCo
kubectl get pods -n CyberCo
















nano redis-service.yml (bisa di satukan opsional dengan deployment)
STEP Manual 
- sudo k3s kubectl create ns cyberco
- kubectl get deploy -n CyberCo
- kubectl get pods -n CyberCo -o wide
- kubectl describe deployment cache-db -n CyberCo 
- kubectl apply -f -

kubectl run test-redis -n CyberCo --rm -it --image=redis:alpine --restart=Never -- ash
redis-cli -h cache-db -p 6379 ping

