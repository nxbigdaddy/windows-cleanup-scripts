@echo off
chcp 65001 >nul
echo 正在清理 OpenCode 残留...

rmdir /S /Q "%APPDATA%\@opencode-ai" 2>nul
rmdir /S /Q "%APPDATA%\ai.opencode.desktop" 2>nul
rmdir /S /Q "%LOCALAPPDATA%\@opencode-aidesktop-updater" 2>nul
rmdir /S /Q "%LOCALAPPDATA%\ai.opencode.desktop" 2>nul
rmdir /S /Q "%USERPROFILE%\.config\opencode" 2>nul
rmdir /S /Q "%USERPROFILE%\.local\share\opencode" 2>nul
rmdir /S /Q "%USERPROFILE%\.cache\opencode" 2>nul

echo 清理完成！
