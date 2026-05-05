lint_scaffold() {
  local status=0
  local phase=""
  local workspace=""
  local name=""
  local phase_dir=""
  local page=""
  local rel=""
  local junk=""
  local diff_check_output=""

  fail() {
    printf 'FAIL: %s\n' "$1" >&2
    status=1
  }

  warn() {
    printf 'WARN: %s\n' "$1" >&2
  }

  require_file() {
    [ -f "$SCAFFOLD_ROOT/$1" ] || fail "Missing file: $1"
  }

  require_dir() {
    [ -d "$SCAFFOLD_ROOT/$1" ] || fail "Missing directory: $1"
  }

  require_file "LLM-WIKI.md"
  require_file "WIKI-SCHEMA.md"
  require_file "AGENT-RULES.md"
  require_file "AGENTS.md"
  require_file "CLAUDE.md"
  require_file "README.md"
  require_file ".gitignore"
  require_file "LICENSE"
  require_file "wiki/index.md"
  require_file "wiki/log.md"
  require_file "wiki/ingest-queue.md"
  require_file "templates/workspace-root.md"
  require_dir "templates/workspace"
  require_dir "workspaces"
  require_dir "repos"

  for phase in raw-input discovery context requirements tech-spec implementation review; do
    require_file "templates/workspace/$phase/README.md"
  done

  for workspace in "$SCAFFOLD_ROOT"/workspaces/*; do
    [ -d "$workspace" ] || continue
    name="$(basename "$workspace")"
    [ -f "$workspace/README.md" ] || fail "Workspace missing README: workspaces/$name"
    if is_generic_name "$name"; then
      fail "Workspace name is too generic: workspaces/$name"
    fi

    for phase_dir in "$workspace"/*; do
      [ -d "$phase_dir" ] || continue
      phase="$(basename "$phase_dir")"
      case "$phase" in
        raw-input|discovery|context|requirements|tech-spec|implementation|review)
          [ -f "$phase_dir/README.md" ] || fail "Phase missing README: workspaces/$name/$phase"
          while IFS= read -r doc; do
            [ -f "$doc" ] || continue
            base="$(basename "$doc")"
            [ "$base" = "README.md" ] && continue
            stem="${base%.*}"
            if is_generic_name "$stem"; then
              fail "Workspace document name is too generic: workspaces/$name/$phase/$base"
            fi
          done < <(find "$phase_dir" -maxdepth 1 -type f | sort)
          ;;
        *)
          warn "Non-standard workspace directory: workspaces/$name/$phase"
          ;;
      esac
    done
  done

  while IFS= read -r page; do
    [ -f "$page" ] || continue
    rel="${page#"$SCAFFOLD_ROOT/wiki/"}"
    case "$rel" in
      index.md|log.md)
        continue
        ;;
    esac
    if ! grep -Fq "$rel" "$SCAFFOLD_ROOT/wiki/index.md"; then
      fail "Wiki page not listed in wiki/index.md: wiki/$rel"
    fi
  done < <(find "$SCAFFOLD_ROOT/wiki" -type f -name '*.md' | sort)

  if grep -Fq -- '- [ ] `' "$SCAFFOLD_ROOT/wiki/ingest-queue.md"; then
    warn "wiki/ingest-queue.md contains pending wiki promotion candidates"
  fi

  while IFS= read -r junk; do
    [ -e "$junk" ] || continue
    if git -C "$SCAFFOLD_ROOT" check-ignore -q "$junk"; then
      rel="${junk#"$SCAFFOLD_ROOT/"}"
      warn "Ignored local noise file exists: $rel"
    fi
  done < <(find "$SCAFFOLD_ROOT" -path "$SCAFFOLD_ROOT/.git" -prune -o \( -name '.DS_Store' -o -name 'Thumbs.db' \) -print | sort)

  diff_check_output="$(git -C "$SCAFFOLD_ROOT" diff --check || true)"
  if [ "$diff_check_output" != "" ]; then
    printf '%s\n' "$diff_check_output" >&2
    fail "git diff --check reported whitespace or conflict-marker issues"
  fi

  if [ "$status" -eq 0 ]; then
    printf 'Scaffold lint passed.\n'
  fi

  exit "$status"
}
