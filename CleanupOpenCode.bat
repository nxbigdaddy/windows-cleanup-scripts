@echo off
chcp 65001 >nul
echo ========================================
echo    OpenCode Cleanup Tool
echo ========================================
echo.
echo This script will delete all OpenCode residual files.
echo.

set /p confirm=Confirm cleanup? (y/n): 
if /i not "%confirm%"=="y" (
    echo Cancelled.
    pause
    exit /b
)

echo.
echo Starting cleanup...
echo.

rmdir /S /Q "%APPDATA%\@opencode-ai" 2>nul
rmdir /S /Q "%APPDATA%\ai.opencode.desktop" 2>nul
rmdir /S /Q "%LOCALAPPDATA%\@opencode-aidesktop-updater" 2>nul
rmdir /S /Q "%LOCALAPPDATA%\ai.opencode.desktop" 2>nul
rmdir /S /Q "%USERPROFILE%\.config\opencode" 2>nul
rmdir /S /Q "%USERPROFILE%\.local\share\opencode" 2>nul
rmdir /S /Q "%USERPROFILE%\.cache\opencode" 2>nul

echo.
echo ========================================
echo    OpenCode Cleanup Complete!
echo ========================================
echo.
pause
