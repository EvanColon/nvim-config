#!/usr/bin/env bash

set -e

echo "[*] Removing Neovim configuration..."
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

echo "[*] Removing Lazy.nvim..."
rm -rf ~/.local/share/lazy/lazy.nvim

echo "[*] Done. Neovim configuration and Lazy.nvim have been removed."

