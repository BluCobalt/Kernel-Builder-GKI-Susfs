#!/usr/bin/env bash
set -euo pipefail

cd kernel_workspace

[ -d common ] || { echo "[-] common/ not found in kernel_workspace" >&2; exit 1; }

echo ">>> Cloning nomount..."

git clone --depth=1 -b "${NOMOUNT_NEXT_REF}" "${NOMOUNT_NEXT_URL}" nomount || echo "[-] Error: Clone failed. Exiting." >&2; exit 1

echo ">>> Copying nomount files..."
mkdir -p common/fs/nomount 
cp -rf nomount/kernel/src/* common/fs/nomount/

echo ">>> nomount integration complete!"