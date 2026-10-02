# Publish the latest game to GitHub Pages: copies ..\whimsy.html over index.html, commits and pushes.
#   .\publish.ps1 "what changed"
param([string]$Message = "Update game")
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
Copy-Item ..\whimsy.html .\index.html -Force
git add -A
if (-not (git status --porcelain)) { Write-Host "Nothing changed - already up to date."; exit 0 }
git commit -m $Message
git push
Write-Host "Pushed. GitHub Pages refreshes in about a minute."
