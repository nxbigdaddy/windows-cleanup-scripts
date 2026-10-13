# 修复 .sh 文件关联脚本
# 请以管理员身份运行此脚本

Write-Host "正在修复 .sh 文件关联..." -ForegroundColor Green

# 方法1: 使用 Set-FileAssociation (Windows 10/11)
# 首先删除现有的用户选择
$userChoicePath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.sh\UserChoice"

if (Test-Path $userChoicePath) {
    Write-Host "删除旧的 UserChoice 配置..." -ForegroundColor Yellow
    # 注意：这个操作可能需要特殊权限
    try {
        Remove-Item -Path $userChoicePath -Force -Recurse
        Write-Host "成功删除 UserChoice" -ForegroundColor Green
    }
    catch {
        Write-Host "无法删除 UserChoice，需要手动操作" -ForegroundColor Red
        Write-Host "请手动执行以下步骤：" -ForegroundColor Yellow
        Write-Host "1. 右键任意 .sh 文件" -ForegroundColor White
        Write-Host "2. 选择 '打开方式' -> '选择其他应用'" -ForegroundColor White
        Write-Host "3. 选择 'Cursor' 并勾选 '始终使用此应用打开 .sh 文件'" -ForegroundColor White
    }
}

# 设置 OpenWithList
$openWithListPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.sh\OpenWithList"
if (Test-Path $openWithListPath) {
    Set-ItemProperty -Path $openWithListPath -Name "a" -Value "Cursor.exe" -Force
    Set-ItemProperty -Path $openWithListPath -Name "MRUList" -Value "a" -Force
    Write-Host "已更新 OpenWithList" -ForegroundColor Green
}

# 刷新系统
Write-Host "刷新系统配置..." -ForegroundColor Yellow
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters

Write-Host "`n修复完成！" -ForegroundColor Green
Write-Host "请重启 Cursor 测试。" -ForegroundColor Cyan
Write-Host "`n如果问题仍然存在，请手动设置：" -ForegroundColor Yellow
Write-Host "1. 找到任意 .sh 文件" -ForegroundColor White
Write-Host "2. 右键 -> 打开方式 -> 选择其他应用" -ForegroundColor White
Write-Host "3. 选择 Cursor，勾选'始终使用此应用'" -ForegroundColor White
