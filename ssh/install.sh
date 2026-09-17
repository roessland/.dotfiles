#!/usr/bin/env bash
# Usage: ssh/install.sh [config] [included file]. Safe to run again.
set -euo pipefail

config="${1:-$HOME/.ssh/config}"
included="${2:-$HOME/.dotfiles/ssh/github.conf}"
line="Include ${included}"

mkdir -p "$(dirname "$config")"
chmod 700 "$(dirname "$config")"
touch "$config"

if grep -Fxq "$line" "$config"; then
  echo "ok       $config already includes $included"
else
  # ssh uses the first value it finds.
  tmp="$(mktemp)"
  { echo "$line"; echo ""; cat "$config"; } > "$tmp"
  cat "$tmp" > "$config"
  rm -f "$tmp"
  echo "set      $config now includes $included"
fi
chmod 600 "$config"
