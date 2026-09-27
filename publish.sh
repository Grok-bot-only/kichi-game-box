#!/usr/bin/env bash
# Publish empty box to a NEW universe/place (never the deep ones).
set -euo pipefail
: "${ROBLOX_OPEN_CLOUD_API_KEY:?need API key}"
: "${UNIVERSE_ID:?need UNIVERSE_ID}"
: "${PLACE_ID:?need PLACE_ID}"
if [[ "$PLACE_ID" == "122194113355813" || "$UNIVERSE_ID" == "10766513367" ]]; then
  echo "REFUSING: that is the deep/lantern publish target" >&2
  exit 2
fi
ROOT="$(cd "$(dirname "$0")" && pwd)"
rojo build -o "$ROOT/game.rbxl"
curl -sS -X POST \
  "https://apis.roblox.com/universes/v1/${UNIVERSE_ID}/places/${PLACE_ID}/versions?versionType=Published" \
  -H "x-api-key: ${ROBLOX_OPEN_CLOUD_API_KEY}" \
  -H "Content-Type: application/octet-stream" \
  --data-binary @"$ROOT/game.rbxl" \
  -o /tmp/kichi-box-publish.json -w "HTTP:%{http_code}\n"
cat /tmp/kichi-box-publish.json; echo
echo "Play: https://www.roblox.com/games/${PLACE_ID}/"
