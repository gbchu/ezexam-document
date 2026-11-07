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

# 2. 读取版本号
$Version = $env:EZEXAM_VERSION
if (-not $Version) {
    $toml = (Invoke-WebRequest -UseBasicParsing "$Repo/raw/main/typst.toml").Content
    $m = [regex]::Match($toml, '(?m)^\s*version\s*=\s*"([^"]+)"')
    if (-not $m.Success) { throw "无法从 typst.toml 解析版本号" }
    $Version = $m.Groups[1].Value
}

# 3. Typst 本地包目录
$Base = Join-Path $env:APPDATA "typst\packages"
$Dest = Join-Path $Base "$Namespace\$Name\$Version"

# 4. 清理并浅克隆
Write-Host "==> 安装 $Name@$Version 到 $Dest"
if (Test-Path $Dest) { Remove-Item -Recurse -Force $Dest }
New-Item -ItemType Directory -Force -Path (Split-Path $Dest) | Out-Null

try {
    git clone --depth 1 --branch "v$Version" $Repo $Dest
} catch {
    git clone --depth 1 $Repo $Dest
}

# 5. 校验
if (-not (Test-Path (Join-Path $Dest "typst.toml"))) { throw "仓库缺少 typst.toml" }

Write-Host "✅ 导入模版完成！引用方式：#import `"@$Namespace/$Name`:$Version`": *"