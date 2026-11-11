#!/usr/bin/env bash
set -euo pipefail

: ${VERSION:=latest}

TARGET_USER="${_REMOTE_USER:-root}"

chown -R 1000:1000 /home/developer

install_args=()
if [[ "${VERSION}" != "latest" ]]; then
    install_args+=("--version" "${VERSION}")
fi

if [[ ${#install_args[@]} -gt 0 ]]; then
    su - "${TARGET_USER}" -c "curl -fsSL https://opencode.ai/v2/install | bash -s -- ${install_args[*]@Q}"
else
    su - "${TARGET_USER}" -c "curl -fsSL https://opencode.ai/v2/install | bash"
fi