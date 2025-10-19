Penjelasan singkat:

- Membuat Namespace cyberco.

- Membuat Deployment cache-db di namespace CyberCo.

- Image redis:buster dipakai.

- replicas: 2 membuat 2 pod.

- containerPort: 6379 membuka port 6379 pada container.

STEP 1 
sudo mkdir -p /home/ubuntu/tech-vault
sudo tee /home/ubuntu/tech-vault/special-definition.yml > /dev/null <<'YAML'
(paste isi YAML dari bagian 1 di sini)
YAML

(Opsional) Salin ke stub path yang diberikan:
sudo cp /home/ubuntu/tech-vault/special-definition.yml /home/ubuntu/tech-vault-q1/special-definition.yml

nano redis-service.yml (bisa di satukan opsional dengan deployment)


STEP 2 
- sudo k3s kubectl create ns cyberco

- kubectl get deploy -n CyberCo
- kubectl get pods -n CyberCo -o wide
- kubectl describe deployment cache-db -n CyberCo 
- kubectl apply -f -

kubectl run test-redis -n CyberCo --rm -it --image=redis:alpine --restart=Never -- ash
redis-cli -h cache-db -p 6379 ping

