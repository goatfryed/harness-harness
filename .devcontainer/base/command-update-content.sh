#!/usr/bin/env bash
set -euo pipefail

script_dir=$(dirname $0)
$script_dir/../features/_zsh-customize/command-update-content.sh

# Ensure mount paths exist and enforce ownership
sudo chown developer:developer \
    /home/developer \
    /home/developer/.local \
    /home/developer/.local/share
sudo chown -R developer:developer \
    /home/developer/.local/share/opencode

