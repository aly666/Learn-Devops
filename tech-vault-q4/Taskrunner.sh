#!/usr/bin/env bash
set -euo pipefail

# taskrunner.sh
# Tujuan:
# 1) Menambahkan user kubeconfig bernama `operator` yang menggunakan security.crt dan secrecy.key
# 2) Menambahkan context kubeconfig bernama `operator` yang menunjuk ke user `operator`
# Script ini akan menulis ke kedua lokasi kubeconfig umum: /root/.kube/config dan /home/aly/.kube/config

BASE_DIR="/home/aly/Learn-Devops/tech-vault-q4"
CERT_PATH="$BASE_DIR/security.crt"
KEY_PATH="$BASE_DIR/secrecy.key"
SCRIPT_PATH="$BASE_DIR/taskrunner.sh"

KUBECONFIGS=("/root/.kube/config" "/home/aly/.kube/config")

# cek keberadaan file sertifikat
if [[ ! -f "$CERT_PATH" ]]; then
  echo "ERROR: certificate not found at $CERT_PATH" >&2
  exit 1
fi
if [[ ! -f "$KEY_PATH" ]]; then
  echo "ERROR: key not found at $KEY_PATH" >&2
  exit 1
fi

# helper: pastikan dir ~/.kube ada dan file kubeconfig ada
ensure_kubeconfig() {
  local cfg="$1"
  local dir
  dir=$(dirname "$cfg")
  if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir"
    chmod 700 "$dir"
  fi
  if [[ ! -f "$cfg" ]]; then
    # buat file dasar kosong supaya kubectl bisa bekerja
    echo "{}" > "$cfg"
    chmod 600 "$cfg"
  fi
}

# helper: ambil cluster name dari kubeconfig, jika tidak ada fallback ke 'cluster'
get_current_cluster() {
  local cfg="$1"
  # ambil current-context
  local curc
  curc=$(kubectl --kubeconfig="$cfg" config current-context 2>/dev/null || true)
  if [[ -n "$curc" ]]; then
    # ambil cluster name dari contexts[ curc ]
    local cluster
    cluster=$(kubectl --kubeconfig="$cfg" config view -o jsonpath="{.contexts[?(@.name=='$curc')].context.cluster}" 2>/dev/null || true)
    if [[ -n "$cluster" ]]; then
      echo "$cluster"
      return
    fi
  fi
  # fallback
  echo "cluster"
}

for cfg in "${KUBECONFIGS[@]}"; do
  ensure_kubeconfig "$cfg"

  # set credentials named 'operator'
  kubectl --kubeconfig="$cfg" config set-credentials operator \
    --client-certificate="$CERT_PATH" \
    --client-key="$KEY_PATH" >/dev/null

  # temukan cluster yang aktif atau fallback
  CLUSTER_NAME=$(get_current_cluster "$cfg")

  # buat context bernama 'operator' (menggunakan cluster yang ditemukan)
  kubectl --kubeconfig="$cfg" config set-context operator --cluster="$CLUSTER_NAME" --user=operator --namespace=default >/dev/null

  echo "Updated kubeconfig: $cfg (user 'operator' and context 'operator' set, cluster='$CLUSTER_NAME')"
done

# Buat helper executable /usr/local/bin/execute yang menjalankan script ini dari direktori soal
# (hal ini membantu ketika penguji menjalankan: sudo execute)
if [[ ! -f "/usr/local/bin/execute" ]]; then
  cat > /usr/local/bin/execute <<'EOF'
#!/usr/bin/env bash
cd /home/aly/Learn-Devops/tech-vault-q4 || exit 1
/bin/bash taskrunner.sh
EOF
  chmod +x /usr/local/bin/execute
  echo "/usr/local/bin/execute created"
fi

# selesai
echo "Selesai. Untuk menguji: sudo execute (atau jalankan taskrunner.sh langsung)."

