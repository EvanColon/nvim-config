Write-Host "[*] Removing Neovim configuration..."
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim-data" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim-cache" -ErrorAction SilentlyContinue

Write-Host "[*] Removing Lazy.nvim..."
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim-data\lazy\lazy.nvim" -ErrorAction SilentlyContinue

Write-Host "[✔] Done. Neovim configuration and Lazy.nvim have been removed."

