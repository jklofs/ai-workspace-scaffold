update_scaffold() {
  local source_root=""
  local dry_run=0
  local force=0
  local timestamp=""
  local update_dir=""
  local report=""
  local added=0
  local updated=0
  local conflicts=0
  local unchanged=0
  local deprecated=0
  local rel=""
  local src=""
  local dest=""
  local candidate=""

  while [ "$#" -gt 0 ]; do
    case "$1" in
      --source)
        source_root="${2:-}"
        shift 2
        ;;
      --dry-run)
        dry_run=1
        shift
        ;;
      --force)
        force=1
        shift
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        printf 'Unknown update option: %s\n' "$1" >&2
        usage >&2
        exit 1
        ;;
    esac
  done

  if [ "$source_root" = "" ]; then
    printf 'Missing required option: --source <latest-scaffold-path>\n' >&2
    exit 1
  fi

  source_root="$(cd "$source_root" && pwd)"

  if [ "$source_root" = "$SCAFFOLD_ROOT" ]; then
    printf 'Source and target are the same directory; nothing to update.\n'
    exit 0
  fi

  if [ ! -f "$source_root/WIKI-SCHEMA.md" ] || [ ! -f "$source_root/scaffold.manifest" ] || [ ! -f "$source_root/scaffold.deprecated" ] || [ ! -d "$source_root/templates/workspace" ]; then
    printf 'Source does not look like an AI Workspace Scaffold checkout: %s\n' "$source_root" >&2
    exit 1
  fi

  timestamp="$(date +%Y%m%d-%H%M%S)"
  update_dir="$SCAFFOLD_ROOT/.scaffold-updates/$timestamp"
  report="$update_dir/report.md"

  if [ "$dry_run" -eq 0 ]; then
    mkdir -p "$update_dir"
    {
      printf '# Scaffold Update Report\n\n'
      printf '**Source:** %s\n' "$source_root"
      printf '**Target:** %s\n' "$SCAFFOLD_ROOT"
      printf '**Generated:** %s\n\n' "$(date +%F)"
    } > "$report"
  fi

  while IFS= read -r rel; do
    src="$source_root/$rel"
    dest="$SCAFFOLD_ROOT/$rel"

    if [ ! -e "$dest" ]; then
      if [ "$dry_run" -eq 1 ]; then
        printf 'ADD: %s\n' "$rel"
      else
        copy_file "$src" "$dest"
        printf '%s%s%s\n' '- Added `' "$rel" '`' >> "$report"
      fi
      added=$((added + 1))
      continue
    fi

    if same_file "$src" "$dest"; then
      unchanged=$((unchanged + 1))
      continue
    fi

    if [ "$force" -eq 1 ]; then
      if [ "$dry_run" -eq 1 ]; then
        printf 'UPDATE: %s\n' "$rel"
      else
        copy_file "$src" "$dest"
        printf '%s%s%s\n' '- Updated `' "$rel" '`' >> "$report"
      fi
      updated=$((updated + 1))
      continue
    fi

    if [ "$dry_run" -eq 1 ]; then
      printf 'CONFLICT: %s\n' "$rel"
    else
      candidate="$update_dir/$rel.new"
      copy_file "$src" "$candidate"
      printf '%s%s%s%s%s\n' '- Candidate update for `' "$rel" '`: `.scaffold-updates/' "$timestamp/$rel" '.new`' >> "$report"
    fi
    conflicts=$((conflicts + 1))
  done < <(relative_managed_files "$source_root")

  while IFS= read -r rel; do
    [ "$rel" = "" ] && continue
    if [ -e "$SCAFFOLD_ROOT/$rel" ]; then
      if [ "$dry_run" -eq 1 ]; then
        printf 'DEPRECATED: %s\n' "$rel"
      else
        printf '%s%s%s\n' '- Deprecated local path still exists: `' "$rel" '`' >> "$report"
      fi
      deprecated=$((deprecated + 1))
    fi
  done < <(relative_deprecated_files "$source_root")

  if [ "$dry_run" -eq 1 ]; then
    return 0
  fi

  {
    printf '\n## Summary\n\n'
    printf '%s\n' "- Added: $added"
    printf '%s\n' "- Updated: $updated"
    printf '%s\n' "- Candidate updates: $conflicts"
    printf '%s\n' "- Deprecated local paths: $deprecated"
    printf '%s\n' "- Unchanged: $unchanged"
  } >> "$report"

  printf 'Scaffold update prepared.\n'
  printf 'Report: %s\n' "$report"
  if [ "$conflicts" -gt 0 ]; then
    printf 'Review candidate updates under: %s\n' "$update_dir"
  fi
}
