@echo off
echo 正在修复 .sh 文件关联...
echo.

:: 删除 UserChoice 项（需要获取所有权）
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.sh\UserChoice" /f 2>nul

:: 设置 .sh 文件用 Cursor 打开
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.sh\OpenWithList" /v "a" /t REG_SZ /d "Cursor.exe" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.sh\OpenWithList" /v "MRUList" /t REG_SZ /d "a" /f

:: 刷新图标缓存和文件关联
ie4uinit.exe -show
taskkill /f /im explorer.exe
start explorer.exe

echo.
echo 修复完成！请重新启动 Cursor 测试。
echo.
pause
