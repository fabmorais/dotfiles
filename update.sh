#!/usr/bin/env bash
# Pull latest dotfiles, re-apply via install.sh, and sync nvim plugins.

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

git -C "$DOTFILES" pull --ff-only

"$DOTFILES/install.sh"

if [[ -d "$HOME/.config/nvim" ]]; then
	nvim --headless "+Lazy! sync" +qa 2>/dev/null || true
fi

echo ""
echo "Update complete."
