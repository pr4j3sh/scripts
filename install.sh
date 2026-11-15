#!/usr/bin/env bash
set -euo pipefail

# Install scripts from pr4j3sh/scripts into ~/.local/bin
# Usage: curl -ssL https://raw.githubusercontent.com/pr4j3sh/scripts/master/install.sh | bash

REPO_RAW="https://raw.githubusercontent.com/pr4j3sh/scripts/master"
BIN_DIR="$HOME/.local/bin"

# name-in-repo (without .sh) -> installed command name
SCRIPTS=(gt)

mkdir -p "$BIN_DIR"

for name in "${SCRIPTS[@]}"; do
  dest="$BIN_DIR/$name"
  curl -ssL "$REPO_RAW/bin/$name.sh" -o "$dest"
  chmod +x "$dest"
  echo "✓ installed: $dest"
done

# PATH check
case ":$PATH:" in
  *":$BIN_DIR:"*) ;;
  *)
    echo
    echo "⚠  $BIN_DIR is not in your PATH."
    case "${SHELL:-}" in
      */zsh) rc="$HOME/.zshrc" ;;
      */bash) rc="$HOME/.bashrc" ;;
      *) rc="your shell rc file" ;;
    esac
    echo "   Add this line to $rc:"
    echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
    ;;
esac
