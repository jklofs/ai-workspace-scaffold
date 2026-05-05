create_workspace() {
  if [ "${1:-}" = "" ]; then
    printf 'Usage: %s create <workspace-name>\n' "$0"
    printf 'Example: %s create user-management\n' "$0"
    printf 'Use a meaningful kebab-case name, not request/task/notes.\n'
    exit 1
  fi

  local name="$1"
  local target=""
  local template=""
  local root_template=""
  local title=""
  local prefix=""
  local today=""

  case "$name" in
    *[!a-z0-9-]* | -* | *-)
      printf 'Workspace name must be kebab-case: lowercase letters, numbers, and hyphens only.\n' >&2
      exit 1
      ;;
  esac

  if is_generic_name "$name"; then
    printf 'Workspace name is too generic. Use a meaningful project, module, feature, or outcome name.\n' >&2
    exit 1
  fi

  target="$SCAFFOLD_ROOT/workspaces/$name"
  template="$SCAFFOLD_ROOT/templates/workspace"
  root_template="$SCAFFOLD_ROOT/templates/workspace-root.md"

  if [ -e "$target" ]; then
    printf 'Workspace already exists: %s\n' "$target" >&2
    exit 1
  fi

  if [ ! -f "$root_template" ]; then
    printf 'Missing workspace root template: %s\n' "$root_template" >&2
    exit 1
  fi

  mkdir -p "$target"
  cp -R "$template/." "$target/"

  title="$(printf '%s' "$name" | awk -F- '{ for (i=1; i<=NF; i++) { $i=toupper(substr($i,1,1)) substr($i,2) } print }' OFS=' ')"
  prefix="$(printf '%s' "$name" | tr '[:lower:]-' '[:upper:]_')"
  today="$(date +%F)"

  sed \
    -e "s/{{WORKSPACE_TITLE}}/$title/g" \
    -e "s/{{UPDATED_DATE}}/$today/g" \
    -e "s/{{WORKSPACE_PREFIX}}/$prefix/g" \
    "$root_template" > "$target/README.md"

  printf 'Created workspace: %s\n' "$target"
  printf 'Next step: update %s/README.md and add original sources to raw-input/.\n' "$target"
}
