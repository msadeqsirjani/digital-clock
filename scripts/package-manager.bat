@echo off
echo ============================================
echo      Digital Clock Package Manager
echo ============================================

if "%1"=="" goto help

if "%1"=="install" goto install
if "%1"=="clean" goto clean
if "%1"=="update" goto update
if "%1"=="audit" goto audit
if "%1"=="start" goto start
if "%1"=="build" goto build
if "%1"=="help" goto help

echo.
echo Error: Unknown command '%1'
goto help

:install
echo.
echo Installing dependencies...
call npm install
echo Dependencies installed successfully
goto end

:clean
echo.
echo Cleaning build artifacts and caches...
if exist node_modules\.vite rd /s /q node_modules\.vite
if exist dist rd /s /q dist
echo Cleaned successfully
goto end

:update
echo.
echo Updating dependencies...
call npm update
echo Dependencies updated successfully
goto end

:audit
echo.
echo Running security audit...
call npm audit
goto end

:start
echo.
echo Starting the development server...
echo The application will be available at: http://localhost:5173
echo Press Ctrl+C to stop the application
echo.
call npm run dev
goto end

:build
echo.
echo Building for production...
call npm run build
echo Build completed successfully
echo The built files are in the dist/ directory
goto end

:help
echo.
echo Usage:
echo   %0 [command]
echo.
echo Available commands:
echo   install - Install dependencies
echo   clean   - Clean build artifacts and caches
echo   update  - Update dependencies
echo   audit   - Run security audit
echo   start   - Start the development server
echo   build   - Build for production
echo   help    - Show this help message
echo.
echo Examples:
echo   %0 install
echo   %0 clean
goto end

:end 