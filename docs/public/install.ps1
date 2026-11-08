$ErrorActionPreference = "Stop"

# ===== 可配置项 =====
$Proxy     = "https://ezexam.pages.dev/proxy"
$Namespace = "local"
$Name      = "ezexam"
# ====================

# 1. 检测 git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "!! 未检测到 git，请先安装 Git for Windows。" -ForegroundColor Red
    throw "git 未安装"
}

# 2. 读取版本号
$Version = $env:EZEXAM_VERSION
if (-not $Version) {
    try {
        $toml = (Invoke-WebRequest -UseBasicParsing -TimeoutSec 15 "$Proxy/raw/main/typst.toml").Content
        $m = [regex]::Match($toml, '(?m)^\s*version\s*=\s*"([^"]+)"')
        if ($m.Success) { $Version = $m.Groups[1].Value }
    } catch { }
}
if (-not $Version) {
    Write-Host "!! 无法获取版本号，请检查网络后重试。" -ForegroundColor Red
    throw "获取版本号失败"
}

# 3. Typst 本地包目录
$Base = Join-Path $env:APPDATA "typst\packages"
$Dest = Join-Path $Base "$Namespace\$Name\$Version"

# 4. 浅克隆并清理 .git
Write-Host "==> 安装 $Name@$Version 到 $Dest"
if (Test-Path $Dest) { Remove-Item -Recurse -Force $Dest }
New-Item -ItemType Directory -Force -Path (Split-Path $Dest) | Out-Null

$env:GIT_HTTP_LOW_SPEED_LIMIT = "1000"
$env:GIT_HTTP_LOW_SPEED_TIME = "30"

try {
    # 注意这里：直接 clone 代理地址
    git clone --depth 1 $Proxy $Dest
} catch {
    throw "git clone 失败，请检查网络后重试"
}

# 5. 校验并清理 .git
if (-not (Test-Path (Join-Path $Dest "typst.toml"))) { throw "仓库缺少 typst.toml" }

$GitDir = Join-Path $Dest ".git"
if (Test-Path $GitDir) { Remove-Item -Recurse -Force $GitDir }

Write-Host "✅ 模版安装完成！引用方式：#import `"@$Namespace/$Name`:$Version`": *"