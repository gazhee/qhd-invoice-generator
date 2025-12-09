@echo off
setlocal enabledelayedexpansion

REM QHD Invoice Generator - Easy Installer for Windows
REM Double-click this file to install and run

REM Change to project root directory (parent of scripts folder)
cd /d "%~dp0.."

title QHD Invoice Generator - Installer

color 0B
cls
echo ================================================
echo    QHD Invoice Generator - 发票生成器
echo    Easy Installation Script for Windows
echo ================================================
echo.

REM Check if Python is installed
echo [1/4] Checking Python installation...
python --version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo X Python is not installed
    echo.
    echo Please install Python 3 from: https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation
    echo.
    pause
    exit /b 1
) else (
    for /f "tokens=*" %%i in ('python --version') do set PYTHON_VERSION=%%i
    echo [OK] Python is installed: !PYTHON_VERSION!
)

echo.

REM Check if all required files exist
echo [2/4] Checking required files...
set ALL_FILES_PRESENT=1

if exist "src\index.html" (
    echo [OK] Found: src\index.html
) else (
    echo [X] Missing: src\index.html
    set ALL_FILES_PRESENT=0
)

if exist "src\manifest.json" (
    echo [OK] Found: src\manifest.json
) else (
    echo [X] Missing: src\manifest.json
    set ALL_FILES_PRESENT=0
)

if exist "src\sw.js" (
    echo [OK] Found: src\sw.js
) else (
    echo [X] Missing: src\sw.js
    set ALL_FILES_PRESENT=0
)

if exist "assets\icons\icon-192.png" (
    echo [OK] Found: assets\icons\icon-192.png
) else (
    echo [X] Missing: assets\icons\icon-192.png
    set ALL_FILES_PRESENT=0
)

if exist "assets\icons\icon-512.png" (
    echo [OK] Found: assets\icons\icon-512.png
) else (
    echo [X] Missing: assets\icons\icon-512.png
    set ALL_FILES_PRESENT=0
)

if !ALL_FILES_PRESENT! == 0 (
    color 0C
    echo.
    echo Some required files are missing!
    echo Please make sure all files are in the same folder.
    echo.
    pause
    exit /b 1
)

echo.

REM Set port
echo [3/4] Setting up port...
set PORT=8080
echo [OK] Will use port: %PORT%

echo.

REM Get IP address
echo [4/4] Getting network information...
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
    set IP=%%a
    goto :found_ip
)
:found_ip
set IP=%IP:~1%
if "%IP%"=="" set IP=localhost
echo [OK] Local IP address: %IP%

echo.
color 0A
echo ================================================
echo [OK] Installation check complete!
echo ================================================
echo.

REM Display access URLs
color 0E
echo Access URLs:
echo.
color 0B
echo For you (on this computer):
color 0F
echo    http://localhost:%PORT%/src/index.html
echo.
color 0B
echo For co-workers (on same network):
color 0F
echo    http://%IP%:%PORT%/src/index.html
echo.
color 0E
echo To install as desktop app:
color 0F
echo    1. Open the URL above in Chrome/Edge
echo    2. Click the install icon in the address bar
echo    3. Click 'Install' button
echo.
echo ================================================
echo.

color 0E
echo Starting web server...
echo Keep this window open while using the app!
echo Press Ctrl+C to stop the server
echo.
color 0A
echo ================================================
echo Server is running on:
color 0F
echo    http://localhost:%PORT%/src/index.html
color 0A
echo ================================================
echo.

REM Open in default browser
timeout /t 1 /nobreak >nul
start http://localhost:%PORT%/src/index.html

REM Start the server
python -m http.server %PORT%

REM This runs when server is stopped
echo.
color 0E
echo Server stopped.
echo.
pause
