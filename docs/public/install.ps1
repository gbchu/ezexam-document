$ErrorActionPreference = "Stop"

# ===== 可配置项 =====
$ProxyUrl  = "https://ezexam.pages.dev/proxy"
$Namespace = "local"
$Name      = "ezexam"
# ====================

# 1. 智能测速（静默执行）
$IsDirect = $false
try {
    $null = Invoke-WebRequest -UseBasicParsing -TimeoutSec 3 -Uri "https://raw.githubusercontent.com/gbchu/ezexam/main/typst.toml"
    $IsDirect = $true
} catch { }

if ($IsDirect) {
    $VersionUrl = "https://raw.githubusercontent.com/gbchu/ezexam/main/typst.toml"
    $ZipUrl = "https://github.com/gbchu/ezexam/archive/refs/heads/main.zip"
} else {
    $VersionUrl = "$ProxyUrl/raw/main/typst.toml"
    $ZipUrl = $ProxyUrl
}

# 2. 获取版本号（带 3 次重试）
$Version = $env:EZEXAM_VERSION
if (-not $Version) {
    for ($i = 1; $i -le 3; $i++) {
        try {
            $toml = (Invoke-WebRequest -UseBasicParsing -TimeoutSec 10 $VersionUrl).Content
            $m = [regex]::Match($toml, '(?m)^\s*version\s*=\s*"([^"]+)"')
            if ($m.Success) {
                $Version = $m.Groups[1].Value
                break
            }
        } catch {
            Start-Sleep -Seconds 1
        }
    }
}

if (-not $Version) {
    Write-Host "!! 无法获取版本号，请检查网络后重试。" -ForegroundColor Red
    throw "获取版本号失败"
}

# 3. Typst 本地包目录
$Base = Join-Path $env:APPDATA "typst\packages"
$Dest = Join-Path $Base "$Namespace\$Name\$Version"

$TmpZip = Join-Path $env:TEMP "ezexam-$Version.zip"
$TmpDir = Join-Path $env:TEMP "ezexam-extract-$Version"

if (Test-Path $TmpZip) { Remove-Item -Force $TmpZip }
if (Test-Path $TmpDir) { Remove-Item -Recurse -Force $TmpDir }

New-Item -ItemType Directory -Force -Path $TmpDir | Out-Null

# 4. 下载源码包
Write-Host "==> 正在下载模版..."
$DownloadSuccess = $false
for ($i = 1; $i -le 3; $i++) {
    try {
        Invoke-WebRequest -UseBasicParsing -TimeoutSec 30 -Uri $ZipUrl -OutFile $TmpZip
        $DownloadSuccess = $true
        break
    } catch {
        Start-Sleep -Seconds 1
    }
}

if (-not $DownloadSuccess) {
    throw "下载失败，请检查网络后重试。"
}

# 5. 解压
Write-Host "==> 正在解压..."
Expand-Archive -Path $TmpZip -DestinationPath $TmpDir -Force

# 6. 导入并清理
Write-Host "==> 导入模版 $Name@$Version 到 $Dest"

$SourceDir = Join-Path $TmpDir "ezexam-main"
Remove-Item -Recurse -Force (Join-Path $SourceDir "template") -ErrorAction SilentlyContinue
Remove-Item -Force (Join-Path $SourceDir "thumbnail.png") -ErrorAction SilentlyContinue
Remove-Item -Force (Join-Path $SourceDir "README.md") -ErrorAction SilentlyContinue
Remove-Item -Force (Join-Path $SourceDir "LICENSE") -ErrorAction SilentlyContinue

if (Test-Path $Dest) { Remove-Item -Recurse -Force $Dest }
New-Item -ItemType Directory -Force -Path (Split-Path $Dest) | Out-Null
Move-Item -Path $SourceDir -Destination $Dest

Remove-Item -Force $TmpZip
Remove-Item -Recurse -Force $TmpDir

Write-Host "✅ 模版导入成功！引用方式："
Write-Host "   #import `"@$Namespace/$Name`:$Version`": *"