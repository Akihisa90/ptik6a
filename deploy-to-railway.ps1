#!/usr/bin/env powershell

# PTIK 6A Railway Deploy Quick Start
# ===================================
# Jalankan file ini untuk commit & push ke GitHub

$projectPath = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "=== PTIK 6A Railway Deploy ===" -ForegroundColor Cyan
Write-Host ""

# Navigate to project
cd $projectPath

# Fix git lock if exists
Write-Host "Checking git status..." -ForegroundColor Yellow
$lockFile = ".\.git\index.lock"
if (Test-Path $lockFile) {
    Write-Host "Removing git lock file..." -ForegroundColor Yellow
    Remove-Item $lockFile -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
}

# Git status
Write-Host "`nGit Status:" -ForegroundColor Green
git status

Write-Host "`n" -ForegroundColor Green

# Prompt untuk GitHub Remote
$repoUrl = Read-Host "Enter your GitHub repository URL (e.g., https://github.com/username/repo.git)"

if ($repoUrl -eq "") {
    Write-Host "Skipped. Repo URL tidak diberikan." -ForegroundColor Yellow
    exit
}

# Add remote
Write-Host "`nAdding GitHub remote..." -ForegroundColor Cyan
git remote add origin $repoUrl

# Configure git user (if not configured)
Write-Host "Configuring git user..." -ForegroundColor Cyan
$userName = Read-Host "Enter your name (or press Enter for 'PTIK 6A Dev')"
if ($userName -eq "") { $userName = "PTIK 6A Dev" }

$userEmail = Read-Host "Enter your email (or press Enter for 'dev@ptik6a.local')"
if ($userEmail -eq "") { $userEmail = "dev@ptik6a.local" }

git config user.name $userName
git config user.email $userEmail

# Stage files
Write-Host "`nStaging all files..." -ForegroundColor Cyan
git add .

# Commit
Write-Host "`nCommitting files..." -ForegroundColor Cyan
git commit -m "Initial commit: PTIK 6A Landing Page with Comments system - Ready for Railway deployment"

# Branch
Write-Host "`nSetting up main branch..." -ForegroundColor Cyan
git branch -M main

# Push
Write-Host "`nPushing to GitHub..." -ForegroundColor Cyan
Write-Host "This will prompt for your GitHub credentials." -ForegroundColor Yellow
git push -u origin main

Write-Host "`n✅ Done! Your code is now on GitHub." -ForegroundColor Green
Write-Host "`nNext Steps:" -ForegroundColor Cyan
Write-Host "1. Go to https://railway.app"
Write-Host "2. Sign up with GitHub"
Write-Host "3. Create new project and select your repository"
Write-Host "4. Add MySQL database"
Write-Host "5. Set environment variables (see RAILWAY_DEPLOY.md)"
Write-Host "6. Deploy!"

Pause
