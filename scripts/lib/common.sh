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
