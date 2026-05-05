#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"

exec codex -C "$root" \
  --sandbox danger-full-access \
  --ask-for-approval never "$@"
