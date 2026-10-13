@echo off
chcp 65001 >nul
echo ========================================
echo    Cursor Cleanup Tool
echo ========================================
echo.
echo This script will delete all Cursor residual files:
echo   - Roaming config data
echo   - Local cache data
echo   - User directory data
echo.

set /p confirm=Confirm cleanup all Cursor residuals? (y/n): 
if /i not "%confirm%"=="y" (
    echo Cancelled.
    pause
    exit /b
)

echo.
echo Starting cleanup...
echo.

echo [1/3] Cleaning Roaming data...
if exist "%APPDATA%\Cursor" (
    rmdir /S /Q "%APPDATA%\Cursor"
    echo   Deleted: %%APPDATA%%\Cursor
)
if exist "%APPDATA%\cursor" (
    rmdir /S /Q "%APPDATA%\cursor"
    echo   Deleted: %%APPDATA%%\cursor
)

echo.
echo [2/3] Cleaning Local data...
if exist "%LOCALAPPDATA%\Cursor" (
    rmdir /S /Q "%LOCALAPPDATA%\Cursor"
    echo   Deleted: %%LOCALAPPDATA%%\Cursor
)
if exist "%LOCALAPPDATA%\cursor" (
    rmdir /S /Q "%LOCALAPPDATA%\cursor"
    echo   Deleted: %%LOCALAPPDATA%%\cursor
)

echo.
echo [3/3] Cleaning user directory data...
if exist "%USERPROFILE%\.cursor" (
    rmdir /S /Q "%USERPROFILE%\.cursor"
    echo   Deleted: %%USERPROFILE%%\.cursor
)

echo.
echo ========================================
echo    Cursor Cleanup Complete!
echo ========================================
echo.
pause
