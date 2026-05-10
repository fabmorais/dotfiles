#!/usr/bin/env bash
# Idempotent dotfiles installer.
# Safe to run multiple times. Existing files are moved to a timestamped
# backup before being replaced by symlinks.

set -euo pipefail
shopt -s nullglob

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

# Fill this in with the URL of your nvim config repo to enable auto-clone
# on fresh machines. Leave empty to skip nvim bootstrap.
NVIM_REPO="https://github.com/fabmorais/nvim" # e.g. "https://github.com/youruser/nvim.git"

backed_up=0

backup_existing() {
	local target="$1"
	local expected_src="$2"

	# Already a symlink to where we want? Done.
	if [[ -L "$target" ]]; then
		if [[ "$(readlink "$target")" == "$expected_src" ]]; then
			return 0
		fi
		rm "$target"
		return 0
	fi

	# Real file/dir? Move it to backup.
	if [[ -e "$target" ]]; then
		if ((backed_up == 0)); then
			mkdir -p "$BACKUP_DIR"
			backed_up=1
		fi
		mv "$target" "$BACKUP_DIR/"
	fi
}

link() {
	local src="$1"
	local dst="$2"
	backup_existing "$dst" "$src"
	ln -sfn "$src" "$dst"
}

# === 1. Sanity ===
if [[ $EUID -eq 0 ]]; then
	echo "Run as a regular user, not root." >&2
	exit 1
fi
mkdir -p "$HOME/.config" "$HOME/.local/bin"

# === 2. Packages (optional manifests) ===
if [[ -f "$DOTFILES/packages/pacman.txt" ]]; then
	echo "Installing pacman packages..."
	sudo pacman -S --needed --noconfirm - <"$DOTFILES/packages/pacman.txt"
fi

if [[ -f "$DOTFILES/packages/aur.txt" ]]; then
	if command -v yay >/dev/null; then
		echo "Installing AUR packages..."
		yay -S --needed --noconfirm - <"$DOTFILES/packages/aur.txt"
	else
		echo "yay not found; skipping AUR. To bootstrap yay:"
		echo "  sudo pacman -S --needed base-devel git"
		echo "  cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
	fi
fi

if [[ -f "$DOTFILES/packages/flatpak.txt" ]]; then
	if command -v flatpak >/dev/null; then
		echo "Installing flatpak packages..."
		flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
		apps=()
		while IFS= read -r line; do
			[[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
			apps+=("$line")
		done <"$DOTFILES/packages/flatpak.txt"
		if ((${#apps[@]} > 0)); then
			flatpak install -y flathub "${apps[@]}"
		fi
	else
		echo "flatpak not installed; skipping flatpak.txt. Install with: sudo pacman -S flatpak"
	fi
fi

# === 3. External repos ===
if [[ -n "$NVIM_REPO" && ! -d "$HOME/.config/nvim" ]]; then
	echo "Cloning nvim repo..."
	git clone "$NVIM_REPO" "$HOME/.config/nvim"
fi

# === 4. config/* → ~/.config/* ===
for dir in "$DOTFILES"/config/*/; do
	link "$dir" "$HOME/.config/$(basename "$dir")"
done

# === 5. Home dotfiles ===
[[ -f "$DOTFILES/zshrc" ]] && link "$DOTFILES/zshrc" "$HOME/.zshrc"
[[ -f "$DOTFILES/tmux.conf" ]] && link "$DOTFILES/tmux.conf" "$HOME/.tmux.conf"

# === 6. Wayland sessions ===
if [[ -d "$DOTFILES/sessions" ]]; then
	sessions=("$DOTFILES"/sessions/*.desktop)
	if ((${#sessions[@]} > 0)); then
		sudo mkdir -p /usr/local/share/wayland-sessions
		sudo install -m 644 "${sessions[@]}" /usr/local/share/wayland-sessions/
	fi
fi

# === 7. Default shell hint ===
if [[ "$SHELL" != *zsh ]] && command -v zsh >/dev/null; then
	echo "Tip: run 'chsh -s \$(which zsh)' to set zsh as default."
fi

# === 8. Summary ===
if ((backed_up == 1)); then
	echo ""
	echo "Pre-existing files moved to: $BACKUP_DIR"
fi
echo ""
echo "Done. Logout and pick your Wayland session at SDDM."
