# Enable TLS for GitHub requests
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$RepoURL = "https://github.com/YOUR_USERNAME/nvim-config.git"
$NvimConfigPath = "$env:LOCALAPPDATA\nvim"
$LazyPath = "$env:LOCALAPPDATA\nvim-data\lazy\lazy.nvim"

Write-Host "[*] Backing up existing Neovim config..."
if (Test-Path $NvimConfigPath) {
    Rename-Item -Path $NvimConfigPath -NewName "nvim_backup_$(Get-Date -Format 'yyyyMMddHHmmss')"
}

Write-Host "[*] Cloning Neovim config..."
git clone $RepoURL $NvimConfigPath

Write-Host "[*] Installing Lazy.nvim..."
git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable $LazyPath

# Install dependencies via winget or choco
if (Get-Command winget -ErrorAction SilentlyContinue) {
    Write-Host "[*] Installing dependencies with winget..."
    winget install -e --id BurntSushi.ripgrep
    winget install -e --id Sharkdp.fd
    winget install -e --id Python.Python.3
    winget install -e --id OpenJS.NodeJS
} elseif (Get-Command choco -ErrorAction SilentlyContinue) {
    Write-Host "[*] Installing dependencies with Chocolatey..."
    choco install -y ripgrep fd python nodejs
} else {
    Write-Host "[!] winget or choco not found. Please install dependencies manually:"
    Write-Host "    - ripgrep"
    Write-Host "    - fd"
    Write-Host "    - Python"
    Write-Host "    - Node.js"
}

Write-Host "[✔] Done. Launch Neovim and run ':Lazy' to finish plugin setup."
