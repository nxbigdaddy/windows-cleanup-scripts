# Opencode 完整清理脚本
# 请在 PowerShell 中运行此脚本

Write-Host "=== Opencode 完整清理工具 ===" -ForegroundColor Cyan
Write-Host ""

# 确认操作
$confirm = Read-Host "确定要清理所有历史记录和缓存吗？这将删除所有会话历史(y/n)"
if ($confirm -ne 'y' -and $confirm -ne 'Y') {
    Write-Host "操作已取消" -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "开始清理..." -ForegroundColor Green

$opencodeBase = "$env:USERPROFILE\.local\share\opencode"
$cachePath = "$env:USERPROFILE\.cache\opencode"
$statePath = "$env:USERPROFILE\.local\state\opencode"

# 1. 删除数据库文件
Write-Host "`n[1/6] 清理数据库文件..." -ForegroundColor Yellow
@(
    "$opencodeBase\opencode.db",
    "$opencodeBase\opencode.db-shm",
    "$opencodeBase\opencode.db-wal"
) | ForEach-Object {
    if (Test-Path $_) {
        Remove-Item $_ -Force
        Write-Host "  已删除: $_" -ForegroundColor Green
    }
}

# 2. 清理 repos 子目录
Write-Host "`n[2/6] 清理 repos 历史..." -ForegroundColor Yellow
@("message", "part", "project", "session", "session_diff", "todo", "migration") | ForEach-Object {
    $dir = "$opencodeBase\repos\$_"
    if (Test-Path $dir) {
        Get-ChildItem $dir -Recurse | Remove-Item -Force -Recurse
        Write-Host "  已清理: repos\$_" -ForegroundColor Green
    }
}

# 3. 清理 storage
Write-Host "`n[3/6] 清理 storage..." -ForegroundColor Yellow
if (Test-Path "$opencodeBase\storage") {
    Get-ChildItem "$opencodeBase\storage" -Recurse | Remove-Item -Force -Recurse
    Write-Host "  已清理 storage" -ForegroundColor Green
}

# 4. 清理 tool-output
Write-Host "`n[4/6] 清理 tool-output..." -ForegroundColor Yellow
if (Test-Path "$opencodeBase\tool-output") {
    Get-ChildItem "$opencodeBase\tool-output" -Recurse | Remove-Item -Force -Recurse
    Write-Host "  已清理 tool-output" -ForegroundColor Green
}

# 5. 清理日志
Write-Host "`n[5/6] 清理日志..." -ForegroundColor Yellow
if (Test-Path "$opencodeBase\log") {
    Get-ChildItem "$opencodeBase\log" -Recurse | Remove-Item -Force -Recurse
    Write-Host "  已清理 log" -ForegroundColor Green
}

# 6. 清理状态文件
Write-Host "`n[6/6] 清理状态文件..." -ForegroundColor Yellow
if (Test-Path "$statePath\locks") {
    Get-ChildItem "$statePath\locks" | Remove-Item -Force
    Write-Host "  已清理 locks" -ForegroundColor Green
}

# 重置 model.json
if (Test-Path "$statePath\model.json") {
    @{ favorite = @(); variant = @{} } | ConvertTo-Json | Set-Content "$statePath\model.json" -Encoding UTF8
    Write-Host "  已重置 model.json" -ForegroundColor Green
}

Write-Host ""
Write-Host "=== 清理完成！===" -ForegroundColor Green
Write-Host ""
Write-Host "请关闭并重新打开 opencode 以应用更改。" -ForegroundColor Cyan
