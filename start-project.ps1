$projectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $projectDir

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "Node.js tidak ditemukan. Instal Node.js terlebih dahulu." -ForegroundColor Red
    Read-Host "Tekan Enter untuk keluar"
    exit 1
}

Write-Host "Menyalakan server aplikasi..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit","-Command","Set-Location '$projectDir'; node server.js"
Start-Sleep -Seconds 4
Start-Process "http://localhost:3000"

Write-Host "Aplikasi dibuka di: http://localhost:3000" -ForegroundColor Cyan
Write-Host "Pastikan MySQL sudah aktif sebelum membuka halaman." -ForegroundColor Yellow
Read-Host "Tekan Enter untuk keluar"
