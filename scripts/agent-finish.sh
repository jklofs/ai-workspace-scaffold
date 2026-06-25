#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf 'Usage: scripts/agent-finish.sh <workspace-name>\n' >&2
}

if [ "$#" -ne 1 ]; then
  usage
  exit 2
fi

workspace_name="$1"
if [[ ! "$workspace_name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
  printf 'Invalid workspace name: %s\n' "$workspace_name" >&2
  usage
  exit 2
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
scaffold_root="$(cd "$script_dir/.." && pwd)"
workspace_dir="$scaffold_root/workspaces/$workspace_name"
scaffold_script="$scaffold_root/scripts/scaffold.sh"

if [ ! -d "$workspace_dir" ]; then
  printf 'Missing workspace: workspaces/%s/ does not exist.\n' "$workspace_name" >&2
  usage
  exit 1
fi

cd "$scaffold_root"

printf 'Agent finish helper for workspace: %s\n' "$workspace_name"
printf 'This optional helper does not replace ./scripts/scaffold.sh as the primary scaffold command.\n'
printf 'Safety: does not modify AGENTS.md, does not promote wiki content, does not commit.\n'

if [ -x "$scaffold_script" ]; then
  ./scripts/scaffold.sh status
  ./scripts/scaffold.sh ingest
  ./scripts/scaffold.sh lint
else
  printf 'Skipping scaffold checks: scripts/scaffold.sh is missing or not executable.\n' >&2
fi

printf '\nManual review candidates:\n'
printf '%s\n' "- workspaces/$workspace_name/review/"

if [ -f "$scaffold_root/wiki/ingest-queue.md" ]; then
  printf '%s\n' '- wiki/ingest-queue.md'
fi

if [ -f "$workspace_dir/review/rule-candidates.md" ]; then
  printf '%s\n' "- workspaces/$workspace_name/review/rule-candidates.md"
fi
