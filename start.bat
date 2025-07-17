@echo off
setlocal enabledelayedexpansion

REM Octra Wallet Generator Setup Script
REM Automated setup: security warning, build from source, run, and open browser

echo === Octra Wallet Generator Setup ===
echo.

REM Show security warning first
echo === ⚠️  SECURITY WARNING ⚠️  ===
echo.
echo This tool generates real cryptographic keys. Always:
echo   - Keep your private keys secure
echo   - Never share your mnemonic phrase
echo   - Don't store wallet files on cloud services
echo   - Use on a secure, offline computer for production wallets
echo.
pause
echo.

REM Function to install Bun
:install_bun
echo Installing Bun...
bun --version >nul 2>&1
if %errorlevel% equ 0 (
    echo Bun is already installed. Version:
    bun --version
) else (
    echo Installing Bun...
    powershell -Command "irm bun.sh/install.ps1 | iex"
    if %errorlevel% neq 0 (
        echo Failed to install Bun. Please install manually from https://bun.sh
        pause
        exit /b 1
    )
    echo Bun installed successfully!
)
goto :eof

REM Build from source
echo === Building from Source ===
echo.

REM Install Bun if not present
call :install_bun

echo.
echo Installing dependencies...
bun install
if %errorlevel% neq 0 (
    echo Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo Building standalone executable...
bun run build
if %errorlevel% neq 0 (
    echo Failed to build executable
    pause
    exit /b 1
)

echo.
echo Build complete!
echo.

REM Execute binary
echo === Starting Wallet Generator ===
echo.
echo Starting wallet generator server...

REM Start the binary in the background
start "Wallet Generator" wallet-generator.exe
if %errorlevel% neq 0 (
    echo Failed to start wallet generator
    pause
    exit /b 1
)

REM Wait a moment for the server to start
timeout /t 2 /nobreak >nul

REM Open browser
echo Opening browser at http://localhost:8888
start http://localhost:8888

echo.
echo Wallet generator is running in the background.
echo Close this window or press Ctrl+C to stop monitoring.
echo To stop the wallet generator, close the "Wallet Generator" window.
echo.

REM Keep the script running to show status
:monitor
timeout /t 5 /nobreak >nul
tasklist /FI "WINDOWTITLE eq Wallet Generator*" 2>nul | find /i "wallet-generator.exe" >nul
if %errorlevel% equ 0 (
    goto monitor
) else (
    echo Wallet generator has stopped.
    pause
    exit /b 0
) 