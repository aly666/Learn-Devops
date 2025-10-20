#!/usr/bin/env bash
# Catatan:
# File security.crt dan secrecy.key disediakan oleh sistem evaluator.
# Skrip ini hanya menggunakan file tersebut untuk membuat user & context kubeconfig.

set -euo pipefail

# Sesuaikan path ke lokasi direktori lokal Anda
BASE_DIR="$HOME/Learn-Devops/tech-vault-q4"
CERT_PATH="$BASE_DIR/security.crt"
KEY_PATH="$BASE_DIR/secrecy.key"
USER_NAME="operator"
CONTEXT_NAME="operator"

# 1) Pastikan file sertifikat & key tersedia
if [ ! -f "$CERT_PATH" ] || [ ! -f "$KEY_PATH" ]; then
  echo "❌ ERROR: File certificate atau key tidak ditemukan:"
  echo "  $CERT_PATH"
  echo "  $KEY_PATH"
  exit 1
fi

# 2) Tambahkan user baru 'operator' ke kubeconfig
kubectl config set-credentials "$USER_NAME" \
  --client-certificate="$CERT_PATH" \
  --client-key="$KEY_PATH"

# 3) Ambil nama cluster aktif atau fallback ke cluster pertama
CURRENT_CONTEXT="$(kubectl config current-context 2>/dev/null || true)"
CLUSTER_NAME=""

if [ -n "$CURRENT_CONTEXT" ]; then
  CLUSTER_NAME="$(kubectl config view -o jsonpath='{.contexts[?(@.name=="'"$CURRENT_CONTEXT"'")].context.cluster}' 2>/dev/null || true)"
fi

if [ -z "$CLUSTER_NAME" ]; then
  CLUSTER_NAME="$(kubectl config view -o jsonpath='{.clusters[0].name}' 2>/dev/null || true)"
fi

if [ -z "$CLUSTER_NAME" ]; then
  echo "❌ ERROR: Tidak menemukan cluster di kubeconfig."
  exit 1
fi

# 4) Buat context baru bernama 'operator'
kubectl config set-context "$CONTEXT_NAME" \
  --cluster="$CLUSTER_NAME" \
  --user="$USER_NAME"

echo "✅ Context '$CONTEXT_NAME' berhasil dibuat untuk cluster '$CLUSTER_NAME' dan user '$USER_NAME'."

