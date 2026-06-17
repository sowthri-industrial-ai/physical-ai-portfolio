#!/usr/bin/env bash
# Fetch sample inspection clips into sample-data/.
# Replace the URLs below with CC-licensed / royalty-free industrial footage
# (e.g. Pexels, Pixabay) or your own clips. Keep files small.
set -euo pipefail

DEST="$(cd "$(dirname "$0")/../sample-data" && pwd)"
mkdir -p "$DEST"

# Add real, licensed clip URLs here:
CLIPS=()

if [ ${#CLIPS[@]} -eq 0 ]; then
  echo "No clips configured yet. Add licensed URLs to CLIPS in this script,"
  echo "or drop your own .mp4 files into: $DEST"
  exit 0
fi

for url in "${CLIPS[@]}"; do
  echo "Downloading: $url"
  curl -L -o "$DEST/$(basename "$url")" "$url"
done
echo "Done. Clips in: $DEST"
