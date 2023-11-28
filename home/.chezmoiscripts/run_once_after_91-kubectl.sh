#!/usr/bin/env bash

set -euo pipefail

# Detect OS
os=$(uname)
case $os in
    Darwin)
    brew install kubectl
    ;;

    Linux)
    cd "$(mktemp -d)"
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    ;;

    *)
    echo "Unsupported OS: ${os}"
    exit 1
esac