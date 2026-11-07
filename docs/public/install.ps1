$ErrorActionPreference = "Stop"

# ===== 可配置项 =====
$Repo      = if ($env:EZEXAM_REPO) { $env:EZEXAM_REPO } else { "https://github.com/gbchu/ezexam" }
$Namespace = "local"
$Name      = "ezexam"
# ====================

# 1. 检测 git，缺失时提示安装方式
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "!! 未检测到 git，无法继续安装。" -ForegroundColor Red
    Write-Host ""
    Write-Host "请先安装 Git for Windows：" -ForegroundColor Yellow
    Write-Host "  方式一：下载安装包 https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "  方式二：winget install --id Git.Git -e --source winget" -ForegroundColor Yellow
    Write-Host ""
    throw "git 未安装"
}

# 2. 读取版本号（带超时）
$Version = $env:EZEXAM_VERSION
if (-not $Version) {
    try {
        $toml = (Invoke-WebRequest -UseBasicParsing -TimeoutSec 15 "$Repo/raw/main/typst.toml").Content
        $m = [regex]::Match($toml, '(?m)^\s*version\s*=\s*"([^"]+)"')
        if ($m.Success) { $Version = $m.Groups[1].Value }
    } catch { }
}

# 读取失败则直接报错退出
if (-not $Version) {
    Write-Host "!! 无法从 GitHub 获取版本号。" -ForegroundColor Red
    Write-Host "   这通常是由于网络连接问题（如无法访问 raw.githubusercontent.com）。" -ForegroundColor Red
    Write-Host "   请检查网络后重试。" -ForegroundColor Red
    throw "获取版本号失败"
}

# 3. Typst 本地包目录（Windows 默认就是 APPDATA）
$Base = Join-Path $env:APPDATA "typst\packages"
$Dest = Join-Path $Base "$Namespace\$Name\$Version"

# 4. 清理并浅克隆
Write-Host "==> 安装 $Name@$Version 到 $Dest"
if (Test-Path $Dest) { Remove-Item -Recurse -Force $Dest }
New-Item -ItemType Directory -Force -Path (Split-Path $Dest) | Out-Null

$env:GIT_HTTP_LOW_SPEED_LIMIT = "1000"
$env:GIT_HTTP_LOW_SPEED_TIME = "30"

# 直接拉取默认分支（main），不再尝试 tag
git clone --depth 1 $Repo $Dest

if ($LASTEXITCODE -ne 0) {
    throw "git clone 失败，请检查网络后重试"
}

# 5. 校验
if (-not (Test-Path (Join-Path $Dest "typst.toml"))) { throw "仓库缺少 typst.toml" }

Write-Host "✅ 完成！引用方式： #import `"@$Namespace/$Name`:$Version`": *"