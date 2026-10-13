@echo off
chcp 65001 >nul
echo ========================================
echo    Cursor 彻底清理工具
echo ========================================
echo.
echo 此脚本将删除所有 Cursor 残留文件：
echo   - Roaming 配置数据
echo   - Local 缓存数据  
echo   - 用户目录数据
echo.

set /p confirm=确定要清理所有 Cursor 残留吗？(y/n): 
if /i not "%confirm%"=="y" (
    echo 操作已取消
    pause
    exit /b
)

echo.
echo 开始清理...
echo.

echo [1/3] 清理 Roaming 数据...
if exist "%APPDATA%\Cursor" (
    rmdir /S /Q "%APPDATA%\Cursor"
    echo   已删除 %%APPDATA%%\Cursor
)
if exist "%APPDATA%\cursor" (
    rmdir /S /Q "%APPDATA%\cursor"
    echo   已删除 %%APPDATA%%\cursor
)

echo.
echo [2/3] 清理 Local 数据...
if exist "%LOCALAPPDATA%\Cursor" (
    rmdir /S /Q "%LOCALAPPDATA%\Cursor"
    echo   已删除 %%LOCALAPPDATA%%\Cursor
)
if exist "%LOCALAPPDATA%\cursor" (
    rmdir /S /Q "%LOCALAPPDATA%\cursor"
    echo   已删除 %%LOCALAPPDATA%%\cursor
)

echo.
echo [3/3] 清理用户目录数据...
if exist "%USERPROFILE%\.cursor" (
    rmdir /S /Q "%USERPROFILE%\.cursor"
    echo   已删除 %%USERPROFILE%%\.cursor
)

echo.
echo ========================================
echo    Cursor 清理完成！
echo ========================================
echo.
pause
