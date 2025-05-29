#!/usr/bin/env bash

set -e

REPO_URL="https://github.com/EvanColon/nvim-config.git"
NVIM_CONFIG="$HOME/.config/nvim"
LAZY_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/lazy/lazy.nvim"

echo "[*] Backing up existing Neovim config..."
[ -d "$NVIM_CONFIG" ] && mv "$NVIM_CONFIG" "${NVIM_CONFIG}_backup_$(date +%s)"

echo "[*] Cloning Neovim config..."
git clone "$REPO_URL" "$NVIM_CONFIG"

echo "[*] Installing Lazy.nvim..."
git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$LAZY_DIR"

# OS Detection
OS=$(uname)
echo "[*] Detected OS: $OS"

install_deps_mac() {
  echo "[*] Installing dependencies with Homebrew..."
  brew install ripgrep fd lua python node
}

install_deps_linux() {
  echo "[*] Installing dependencies with system package manager..."
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y ripgrep fd-find python3 python3-pip nodejs npm
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y ripgrep fd-find python3 python3-pip nodejs npm
  elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Sy --noconfirm ripgrep fd python nodejs npm
  else
    echo "[!] Unsupported Linux distro. Please install dependencies manually."
  fi
}

case "$OS" in
  Darwin) install_deps_mac ;;
  Linux) install_deps_linux ;;
  *) echo "[!] Unsupported OS: $OS"; exit 1 ;;
esac

echo "[✔] Done. Launch Neovim and run :Lazy to finish plugin installation."
