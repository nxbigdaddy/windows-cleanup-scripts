# Windows 清理与文件关联修复脚本

> 由内部工程脱敏整理后开源。原目录：`rc` ｜ 领域：小工具

## 项目简介

系统清理与文件关联修复脚本（bat/ps1/reg，11 个文件）

## 技术栈

未标注

## 目录结构

```text
├── CleanupCursor.bat
├── CleanupOpenCode.bat
├── fix_sh_file_association.reg
├── 一键清理opencode.bat
├── 修复SH文件关联.bat
├── 修复SH文件关联.ps1
├── 彻底卸载OpenCode.bat
├── 清理Cursor残留.bat
├── 清理opencode历史.ps1
├── 清理残留.bat
├── 设置SH默认用Cursor打开.reg
```

## 快速开始

```bash
git clone <你的仓库地址>
cd windows-cleanup-scripts
```

- 依赖安装与启动方式请参考仓库内各子目录的 README 与配置文件。
- 所有配置模板均以 `*.example` 形式提供，请复制后填入你自己的密钥与地址。

## 脱敏说明

本仓库由内部工程导出，导出时已执行以下处理：

- **删除**：私钥与证书（`*.pem` / `*.key` / `*.pfx` / `id_rsa*` / `id_ed25519*`）、`.env` 实例文件、
  数据库与备份（`*.sql` 数据导出 / `*.db` / `*.sqlite` / `*.bak` / `*.mdf`）、cookie 与本地配置、
  依赖目录与构建产物、压缩包与安装程序、大体积媒体文件。
- **替换**：口令、API Key、Token、连接串密码、内网 IP、企业域名与企业名称，均替换为占位符。
- **保留**：可公开的源码、配置模板（`.env.example`）、文档、测试与少量必要素材。

如仍发现遗漏的敏感信息，请提交 Issue，我们会立即处理。

## 许可证

MIT
