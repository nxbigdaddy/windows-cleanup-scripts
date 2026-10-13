@echo off
chcp 65001 >nul
echo ========================================
echo    OpenCode 彻底卸载工具
echo ========================================
echo.
echo 此脚本将删除所有 OpenCode 相关文件：
echo   - 主程序目录
echo   - 开始菜单快捷方式
echo   - 桌面快捷方式
echo   - Roaming 数据
echo   - Local 缓存
echo   - 更新器文件
echo.

set /p confirm=确定要彻底卸载 OpenCode 吗？(y/n): 
if /i not "%confirm%"=="y" (
    echo 操作已取消
    pause
    exit /b
)

echo.
echo 开始卸载...
echo.

echo [1/8] 关闭 OpenCode 进程...
taskkill /F /IM "OpenCode.exe" >nul 2>&1
taskkill /F /FI "WINDOWTITLE eq *OpenCode*" >nul 2>&1
echo   已完成

echo.
echo [2/8] 删除主程序目录...
if exist "%LOCALAPPDATA%\Programs\@opencode-aidesktop" (
    rmdir /S /Q "%LOCALAPPDATA%\Programs\@opencode-aidesktop"
    echo   已删除主程序
) else (
    echo   主程序已不存在
)

echo.
echo [3/8] 删除开始菜单快捷方式...
if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\OpenCode.lnk" (
    del /F /Q "%APPDATA%\Microsoft\Windows\Start Menu\Programs\OpenCode.lnk"
    echo   已删除开始菜单快捷方式
) else (
    echo   开始菜单快捷方式已不存在
)

echo.
echo [4/8] 删除桌面快捷方式...
if exist "%USERPROFILE%\Desktop\OpenCode.lnk" (
    del /F /Q "%USERPROFILE%\Desktop\OpenCode.lnk"
    echo   已删除桌面快捷方式
)
if exist "%PUBLIC%\Desktop\OpenCode.lnk" (
    del /F /Q "%PUBLIC%\Desktop\OpenCode.lnk"
    echo   已删除公共桌面快捷方式
)

echo.
echo [5/8] 删除 Roaming 数据...
if exist "%APPDATA%\@opencode-ai" (
    rmdir /S /Q "%APPDATA%\@opencode-ai"
    echo   已删除 @opencode-ai
)
if exist "%APPDATA%\ai.opencode.desktop" (
    rmdir /S /Q "%APPDATA%\ai.opencode.desktop"
    echo   已删除 ai.opencode.desktop
)

echo.
echo [6/8] 删除 Local 缓存...
if exist "%LOCALAPPDATA%\@opencode-aidesktop-updater" (
    rmdir /S /Q "%LOCALAPPDATA%\@opencode-aidesktop-updater"
    echo   已删除 updater
)
if exist "%LOCALAPPDATA%\ai.opencode.desktop" (
    rmdir /S /Q "%LOCALAPPDATA%\ai.opencode.desktop"
    echo   已删除 ai.opencode.desktop
)

echo.
echo [7/8] 清理 npm 包（如果存在）...
npm uninstall -g opencode-ai >nul 2>&1
echo   已完成

echo.
echo [8/8] 清理临时文件...
if exist "%TEMP%\opencode" (
    rmdir /S /Q "%TEMP%\opencode"
    echo   已清理临时文件
)

echo.
echo ========================================
echo    卸载完成！
echo ========================================
echo.
echo 如果还有残留文件，请重启电脑后再检查。
echo.
pause
