#!/usr/bin/env bash
# Upload sample data as release assets and print URLs and SHA-256 hashes.
# Usage: TAG=v1 ./upload_data.sh file1.fits file2.fits ...

set -euo pipefail

REPO=${REPO:-LM-SAL/aiapy-data}
TAG=${TAG:-v1}

if [ $# -eq 0 ]; then
    echo "usage: TAG=v1 $0 <file> [<file> ...]" >&2
    exit 1
fi

gh release view "$TAG" --repo "$REPO" >/dev/null 2>&1 ||
    gh release create "$TAG" --repo "$REPO" --title "Data $TAG" --notes "Sample and test data for aiapy."

gh release upload "$TAG" "$@" --repo "$REPO" --clobber

for data_file in "$@"; do
    filename=$(basename "$data_file")
    echo "https://github.com/$REPO/releases/download/$TAG/$filename"
    sha256sum "$data_file"
done
