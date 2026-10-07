@echo off
setlocal
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
    echo Node.js tidak ditemukan. Instal Node.js terlebih dahulu.
    pause
    exit /b 1
)

echo Menyalakan server aplikasi...
start "RuangKelas Server" cmd /k "node server.js"

echo Menunggu server siap...
timeout /t 4 >nul

start "" http://localhost:3000

echo.
echo Aplikasi dibuka di: http://localhost:3000
 echo Jika halaman tidak terbuka, pastikan MySQL sudah hidup dan server berjalan di terminal baru.
echo Tekan tombol apapun untuk menutup pesan ini...
pause >nul
