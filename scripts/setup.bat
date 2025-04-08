@echo off
echo ============================================
echo       Digital Clock Setup Script
echo ============================================

echo.
echo Checking for Node.js...
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Node.js could not be found. Please install Node.js (v14 or higher) from https://nodejs.org/
    exit /b 1
)

for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
echo Node.js is installed: %NODE_VERSION%

echo.
echo Checking for npm...
where npm >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo npm could not be found. Please ensure npm is installed with Node.js
    exit /b 1
)

for /f "tokens=*" %%i in ('npm -v') do set NPM_VERSION=%%i
echo npm is installed: %NPM_VERSION%

echo.
echo Installing dependencies...
call npm install
echo Dependencies installed successfully

echo.
echo Setup complete!

echo.
set /p START_APP="Would you like to start the application now? (y/n): "
if /i "%START_APP%"=="y" (
    echo.
    echo Starting the application...
    echo The application will be available at: http://localhost:5173
    echo Press Ctrl+C to stop the application
    echo.
    call npm run dev
) else (
    echo.
    echo You can start the application later with: npm run dev
    echo The application will be available at: http://localhost:5173
    echo.
) 