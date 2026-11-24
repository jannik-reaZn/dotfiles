#!/usr/bin/env bash
# Idempotent installer for dev containers (used by the VS Code "dotfiles.installCommand").
# Installs missing tools (stow, tmux, neovim) and links the configs with stow.
set -euo pipefail
cd "$(dirname "$0")"

PACKAGES=(nvim tmux)

SUDO=""
[ "$(id -u)" -ne 0 ] && SUDO="sudo"

APT_UPDATED=0
apt_install() {
    if [ "$APT_UPDATED" -eq 0 ]; then
        $SUDO apt-get update -qq
        APT_UPDATED=1
    fi
    $SUDO apt-get install -y -qq "$@"
}

install_neovim() {
    case "$(uname -m)" in
        x86_64) arch="x86_64" ;;
        aarch64 | arm64) arch="arm64" ;;
        *) echo "Unsupported architecture for neovim: $(uname -m)" >&2; return 1 ;;
    esac
    curl -fsSL "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${arch}.tar.gz" \
        | $SUDO tar -xz -C /opt
    $SUDO ln -sf "/opt/nvim-linux-${arch}/bin/nvim" /usr/local/bin/nvim
}

command -v stow >/dev/null || apt_install stow
command -v tmux >/dev/null || apt_install tmux
command -v nvim >/dev/null || install_neovim

# -R re-stows, so running this script multiple times is safe
stow -R "${PACKAGES[@]}"
