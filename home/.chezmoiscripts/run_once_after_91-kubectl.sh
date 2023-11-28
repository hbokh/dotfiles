#!/usr/bin/env bash

set -eufo pipefail

os=$(uname)
case $os in
    Darwin)
    brew install kubernetes-cli
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