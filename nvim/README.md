# 🧠 My Neovim IDE Config# 🧠 My Neovim IDE Config

This is my cross-platform Neovim setup optimized for development on **Fedora Linux**, **macOS**, and **Windows**.

---

## 🚀 Features

- 📦 Plugin management via [Lazy.nvim](https://github.com/folke/lazy.nvim)
- 🔭 Fuzzy finding with Telescope
- 🌳 Syntax highlighting and code parsing with Treesitter
- ⚙️ LSP and DAP integration
- 🛠️ Custom keymaps, UI themes, and snippets
- 🔤 Nerd Font support with JetBrainsMono Nerd Font

---

## 🛠️ Installation

### ▶️ Linux / macOS

Open your terminal and run:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/yourusername/nvim-config/main/install.sh)"
```
### Windows (PowerShell)
```
iwr -useb https://raw.githubusercontent.com/yourusername/nvim-config/main/install.ps1 | iex
```

Absolutely — here’s the full `README.md` content in a single copy-pasteable Markdown file:

---

````markdown
# 🧠 My Neovim IDE Config

This is my cross-platform Neovim setup optimized for development on **Fedora Linux**, **macOS**, and **Windows**.

---

## 🚀 Features

- 📦 Plugin management via [Lazy.nvim](https://github.com/folke/lazy.nvim)
- 🔭 Fuzzy finding with Telescope
- 🌳 Syntax highlighting and code parsing with Treesitter
- ⚙️ LSP and DAP integration
- 🛠️ Custom keymaps, UI themes, and snippets
- 🔤 Nerd Font support with JetBrainsMono Nerd Font

---

## 🛠️ Installation

### ▶️ Linux / macOS

Open your terminal and run:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/yourusername/nvim-config/main/install.sh)"
````

### 🪟 Windows (PowerShell)

Open PowerShell and run:

```powershell
iwr -useb https://raw.githubusercontent.com/yourusername/nvim-config/main/install.ps1 | iex
```

---

## 📦 Dependencies

These will be installed automatically via `apt`, `dnf`, `brew`, `winget`, or `choco` depending on your OS:

* [Neovim 0.9+](https://neovim.io)
* Git
* [`ripgrep`](https://github.com/BurntSushi/ripgrep)
* [`fd`](https://github.com/sharkdp/fd)
* Python 3
* Node.js + npm

---

## 🔤 Nerd Font Required: JetBrainsMono

This Neovim config uses icons throughout the interface. To display these properly, you **must install a Nerd Font**.

> 🎯 Recommended: [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)

### Used by Plugins:

* `nvim-web-devicons` – file/folder icons
* `lualine.nvim` – statusline symbols
* `telescope.nvim` – prompt icons
* `nvim-tree.lua` – file explorer UI
* `which-key.nvim`, `bufferline.nvim`, and others

### Installation

#### macOS

```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

#### Ubuntu/Debian

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
```

#### Fedora

```bash
sudo dnf install curl unzip fontconfig
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
```

#### Windows

1. Download from: [https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)
2. Install the font (`.ttf`) via right-click → **Install for all users**
3. In your terminal app (like Windows Terminal or Alacritty), go to **Settings → Font Face**, and choose **JetBrainsMono Nerd Font**

---

## 🧹 Uninstall / Cleanup

### Linux / macOS

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/yourusername/nvim-config/main/uninstall.sh)"
```

### Windows (PowerShell)

```powershell
iwr -useb https://raw.githubusercontent.com/yourusername/nvim-config/main/uninstall.ps1 | iex
```

---


📦 Dependencies

These will be installed automatically via apt, dnf, brew, winget, or choco depending on your OS:

    Neovim 0.9+

    Git

    ripgrep

    fd

    Python 3

    Node.js + npm


🔤 Nerd Font Required: JetBrainsMono

This Neovim config uses icons throughout the interface. To display these properly, you must install a Nerd Font.

    🎯 Recommended: JetBrainsMono Nerd Font

Used by Plugins:

    nvim-web-devicons – file/folder icons

    lualine.nvim – statusline symbols

    telescope.nvim – prompt icons

    nvim-tree.lua – file explorer UI

    which-key.nvim, bufferline.nvim, and others

Installation
### macOS
```
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

### Ubuntu/Debian
```
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
```


### Windows

    Download from: https://www.nerdfonts.com/font-downloads

    Install the font (.ttf) via right-click → Install for all users

    In your terminal app (like Windows Terminal or Alacritty), go to Settings → Font Face, and choose JetBrainsMono Nerd Font

🧹 Uninstall / Cleanup
Linux / macOS

```bash -c "$(curl -fsSL https://raw.githubusercontent.com/yourusername/nvim-config/main/uninstall.sh)"```

Windows (PowerShell)

```iwr -useb https://raw.githubusercontent.com/yourusername/nvim-config/main/uninstall.ps1 | iex```


