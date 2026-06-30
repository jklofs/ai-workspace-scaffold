#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"

command -v opencode >/dev/null 2>&1 || {
  printf 'Missing opencode CLI. Install OpenCode and try again.\n' >&2
  exit 1
}

cd "$root"

if [ "$#" -eq 0 ]; then
  session_id="${OPENCODE_SESSION_ID:-}"
  session_file="${OPENCODE_SESSION_FILE:-$root/.opencode/session-id}"

  if [ -z "$session_id" ] && [ -f "$session_file" ]; then
    IFS= read -r session_id < "$session_file" || session_id=""
  fi

  if [ -z "$session_id" ]; then
    printf 'Missing OpenCode session id.\n' >&2
    printf 'Set OPENCODE_SESSION_ID=ses_xxx or write ses_xxx to .opencode/session-id.\n' >&2
    printf '\nAvailable sessions:\n' >&2
    opencode session list >&2 || true
    exit 2
  fi

  exec opencode --session "$session_id"
fi

exec opencode "$@"
