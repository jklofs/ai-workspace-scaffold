is_generic_name() {
  case "$1" in
    request|requests|task|tasks|workspace|workspaces|note|notes|input|inputs|draft|document|doc|spec|requirements|implementation|review|misc|temp|tmp)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

copy_file() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  cp -p "$src" "$dest"
}

same_file() {
  cmp -s "$1" "$2"
}

matches_manifest() {
  local manifest="$1"
  local rel="$2"
  local pattern=""

  [ -f "$manifest" ] || return 1

  while IFS= read -r pattern; do
    case "$pattern" in
      ""|\#*)
        continue
        ;;
    esac
    case "$rel" in
      $pattern)
        return 0
        ;;
    esac
  done < "$manifest"

  return 1
}

is_managed_path() {
  local manifest="$1"
  local rel="$2"
  matches_manifest "$manifest" "$rel"
}

is_excluded_path() {
  case "$1" in
    .git/*|.scaffold-updates/*|repos/*/.git/*|workspaces/scaffold/*)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

relative_managed_files() {
  local source_root="$1"
  local manifest="$source_root/scaffold.manifest"

  if [ ! -f "$manifest" ]; then
    printf 'Missing scaffold manifest: %s\n' "$manifest" >&2
    exit 1
  fi

  find "$source_root" -type f | while IFS= read -r src; do
    rel="${src#"$source_root"/}"
    if is_excluded_path "$rel"; then
      continue
    fi
    if is_managed_path "$manifest" "$rel"; then
      printf '%s\n' "$rel"
    fi
  done | sort
}

relative_deprecated_files() {
  local source_root="$1"
  local deprecated="$source_root/scaffold.deprecated"
  local rel=""

  [ -f "$deprecated" ] || return 0

  while IFS= read -r rel; do
    case "$rel" in
      ""|\#*)
        continue
        ;;
    esac
    printf '%s\n' "$rel"
  done < "$deprecated" | sort
}
