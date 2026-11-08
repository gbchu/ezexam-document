$ErrorActionPreference = "Stop"

# ===== 可配置项 =====
$Proxy     = "https://ezexam.pages.dev/proxy"
$Namespace = "local"
$Name      = "ezexam"
# ====================

# 1. 获取版本号
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

# 2. Typst 本地包目录
$Base = Join-Path $env:APPDATA "typst\packages"
$Dest = Join-Path $Base "$Namespace\$Name\$Version"

# 3. 下载并解压
Write-Host "==> 导入模板 $Name@$Version 到 $Dest"
$TmpZip = Join-Path $env:TEMP "ezexam-$Version.zip"
$TmpDir = Join-Path $env:TEMP "ezexam-extract-$Version"

if (Test-Path $Dest) { Remove-Item -Recurse -Force $Dest }
if (Test-Path $TmpZip) { Remove-Item -Force $TmpZip }
if (Test-Path $TmpDir) { Remove-Item -Recurse -Force $TmpDir }

New-Item -ItemType Directory -Force -Path (Split-Path $Dest) | Out-Null
New-Item -ItemType Directory -Force -Path $TmpDir | Out-Null

Write-Host "==> 正在下载模版..."
Invoke-WebRequest -UseBasicParsing -TimeoutSec 30 -Uri $Proxy -OutFile $TmpZip

Write-Host "==> 正在解压..."
# PowerShell 原生解压，不需要装第三方工具
Expand-Archive -Path $TmpZip -DestinationPath $TmpDir -Force

# 移动到目标目录
$ExtractedFolder = Get-ChildItem -Path $TmpDir | Select-Object -First 1
Move-Item -Path $ExtractedFolder.FullName -Destination $Dest

# 清理
Remove-Item -Force $TmpZip
Remove-Item -Recurse -Force $TmpDir

Write-Host "✅ 导入模板成功！引用方式："
Write-Host "   #import `"@$Namespace/$Name`:$Version`": *"