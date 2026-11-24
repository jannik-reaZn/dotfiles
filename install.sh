#!/usr/bin/env bash
# Idempotent installer for dev containers (used by the VS Code "dotfiles.installCommand").
# Installs missing tools (stow, tmux, neovim, lazygit and their helpers) and links the configs with stow.
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

install_lazygit() {
    case "$(uname -m)" in
        x86_64) arch="x86_64" ;;
        aarch64 | arm64) arch="arm64" ;;
        *) echo "Unsupported architecture for lazygit: $(uname -m)" >&2; return 1 ;;
    esac
    tag="$(curl -fsSLI -o /dev/null -w '%{url_effective}' https://github.com/jesseduffield/lazygit/releases/latest)"
    version="${tag##*/v}"
    curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/v${version}/lazygit_${version}_Linux_${arch}.tar.gz" \
        | $SUDO tar -xz -C /usr/local/bin lazygit
}

# Collect missing apt packages and install them in one go
APT_PACKAGES=()
need() { command -v "$1" >/dev/null || APT_PACKAGES+=("$2"); }
need stow stow
need tmux tmux
need rg ripgrep
need fzf fzf
need unzip unzip
need xclip xclip
# On Debian/Ubuntu the fd binary is called fdfind
command -v fd >/dev/null || command -v fdfind >/dev/null || APT_PACKAGES+=(fd-find)
[ "${#APT_PACKAGES[@]}" -eq 0 ] || apt_install "${APT_PACKAGES[@]}"
command -v fd >/dev/null || $SUDO ln -s "$(command -v fdfind)" /usr/local/bin/fd

command -v nvim >/dev/null || install_neovim
command -v lazygit >/dev/null || install_lazygit

# -R re-stows, so running this script multiple times is safe
stow -R "${PACKAGES[@]}"
