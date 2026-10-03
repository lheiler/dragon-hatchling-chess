#!/usr/bin/env bash
# Download the official Stockfish release into tools/stockfish (ignored by git).
# The "universal" build picks the best instruction set (AVX2/AVX-512/...) at runtime.
set -euo pipefail

VERSION="sf_19"
ASSET="stockfish-linux-x86-64-universal"
URL="https://github.com/official-stockfish/Stockfish/releases/download/${VERSION}/${ASSET}.tar.gz"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="${ROOT}/tools"
BIN="${DEST}/stockfish/${ASSET}"

if [[ -x "${BIN}" ]]; then
    echo "Stockfish already present: ${BIN}"
else
    mkdir -p "${DEST}"
    echo "Downloading ${URL}"
    curl -fL --progress-bar "${URL}" | tar -xz -C "${DEST}"
fi

printf 'uci\nquit\n' | "${BIN}" | grep '^id name'
echo "Engine path: ${BIN}"
