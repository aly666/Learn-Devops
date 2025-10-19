#!/bin/bash

echo "🔍 Mengecek resource Kubernetes terkait Chief Admin..."
echo "------------------------------------------------------"

# Fungsi untuk memeriksa status resource
check_resource() {
  local type=$1
  local name=$2
  local namespace=$3
  if [ -n "$namespace" ]; then
    if kubectl get "$type" "$name" -n "$namespace" &>/dev/null; then
      echo "✅ $type '$name' ditemukan di namespace '$namespace'"
    else
      echo "❌ $type '$name' TIDAK ditemukan di namespace '$namespace'"
    fi
  else
    if kubectl get "$type" "$name" &>/dev/null; then
      echo "✅ $type '$name' ditemukan"
    else
      echo "❌ $type '$name' TIDAK ditemukan"
    fi
  fi
}

# 1. Cek ServiceAccount
check_resource "serviceaccount" "chief-admin" "default"

# 2. Cek ClusterRole
check_resource "clusterrole" "monitor"

# 3. Cek ClusterRoleBinding
check_resource "clusterrolebinding" "chiefadmin-monitor"

echo "------------------------------------------------------"
echo "✅ Pemeriksaan selesai."

