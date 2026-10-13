@echo off
chcp 65001 >nul
echo ========================================
echo    Opencode 一键清理工具
echo ========================================
echo.
echo 此脚本将删除以下所有内容：
echo   - 数据库文件 (opencode.db)
echo   - 项目历史记录 (repos)
echo   - 存储数据 (storage)
echo   - 工具输出缓存 (tool-output)
echo   - 日志文件 (log)
echo   - 缓存文件 (cache)
echo   - 锁文件和状态
echo.

set /p confirm=确定要清理吗？(y/n): 
if /i not "%confirm%"=="y" (
    echo 操作已取消
    pause
    exit /b
)

echo.
echo 开始清理...
echo.

echo [1/8] 关闭 opencode 进程...
taskkill /F /IM node.exe /FI "WINDOWTITLE eq *opencode*" >nul 2>&1
if errorlevel 1 (
    echo   未发现运行中的 opencode
) else (
    echo   已关闭 opencode
)

echo.
echo [2/8] 清理数据库文件...
if exist "%USERPROFILE%\.local\share\opencode\opencode.db" (
    del /F /Q "%USERPROFILE%\.local\share\opencode\opencode.db"
    echo   已删除 opencode.db
)
if exist "%USERPROFILE%\.local\share\opencode\opencode.db-shm" (
    del /F /Q "%USERPROFILE%\.local\share\opencode\opencode.db-shm"
    echo   已删除 opencode.db-shm
)
if exist "%USERPROFILE%\.local\share\opencode\opencode.db-wal" (
    del /F /Q "%USERPROFILE%\.local\share\opencode\opencode.db-wal"
    echo   已删除 opencode.db-wal
)

echo.
echo [3/8] 清理 repos 历史...
if exist "%USERPROFILE%\.local\share\opencode\repos" (
    rmdir /S /Q "%USERPROFILE%\.local\share\opencode\repos"
    echo   已清理 repos
)

echo.
echo [4/8] 清理 storage...
if exist "%USERPROFILE%\.local\share\opencode\storage" (
    rmdir /S /Q "%USERPROFILE%\.local\share\opencode\storage"
    echo   已清理 storage
)

echo.
echo [5/8] 清理 tool-output...
if exist "%USERPROFILE%\.local\share\opencode\tool-output" (
    rmdir /S /Q "%USERPROFILE%\.local\share\opencode\tool-output"
    echo   已清理 tool-output
)

echo.
echo [6/8] 清理日志...
if exist "%USERPROFILE%\.local\share\opencode\log" (
    rmdir /S /Q "%USERPROFILE%\.local\share\opencode\log"
    echo   已清理 log
)

echo.
echo [7/8] 清理缓存...
if exist "%USERPROFILE%\.cache\opencode" (
    rmdir /S /Q "%USERPROFILE%\.cache\opencode"
    echo   已清理 cache
)

echo.
echo [8/8] 清理状态文件...
if exist "%USERPROFILE%\.local\state\opencode\locks" (
    rmdir /S /Q "%USERPROFILE%\.local\state\opencode\locks"
    echo   已清理 locks
)
if exist "%USERPROFILE%\.local\state\opencode\model.json" (
    (
        echo {
        echo   "favorite": [],
        echo   "variant": {}
        echo }
    ) > "%USERPROFILE%\.local\state\opencode\model.json"
    echo   已重置 model.json
)

echo.
echo ========================================
echo    清理完成！
echo ========================================
echo.
echo 现在可以重新打开 opencode，将是一个全新的状态。
echo.
pause
