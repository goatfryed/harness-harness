#!/usr/bin/env bash
set -euo pipefail

script_dir=$(dirname $0)
$script_dir/../base/command-update-content.sh

# Ensure mount paths exist and enforce ownership
sudo chown developer:developer \
    /home/developer/.cargo/
