$ErrorActionPreference = "Stop"

# ===== 可配置项 =====
$ProxyUrl  = "https://ezexam.pages.dev/proxy"
$GhProxy   = "https://gh-proxy.com"
$DirectZip = "https://github.com/gbchu/ezexam/archive/refs/heads/main.zip"
$DirectVersion = "https://raw.githubusercontent.com/gbchu/ezexam/main/typst.toml"
$Namespace = "local"
$Name      = "ezexam"
# ====================

# 1. 智能测速（三级容灾）
$Mode = 3
$VersionUrl = "$ProxyUrl/raw/main/typst.toml"
$ZipUrl = $ProxyUrl

try {
    $null = Invoke-WebRequest -UseBasicParsing -TimeoutSec 3 -Uri "$GhProxy/https://raw.githubusercontent.com/gbchu/ezexam/main/typst.toml"
    $Mode = 1
    $VersionUrl = "$GhProxy/https://raw.githubusercontent.com/gbchu/ezexam/main/typst.toml"
    $ZipUrl = "$GhProxy/https://github.com/gbchu/ezexam/archive/refs/heads/main.zip"
} catch {
    try {
        $null = Invoke-WebRequest -UseBasicParsing -TimeoutSec 3 -Uri $DirectVersion
        $Mode = 2
        $VersionUrl = $DirectVersion
        $ZipUrl = $DirectZip
    } catch { }
}

# 2. 获取版本号
$Version = $env:EZEXAM_VERSION
if (-not $Version) {
    for ($i = 1; $i -le 3; $i++) {
        if ($i -eq 2 -and $Mode -eq 1) { $VersionUrl = $DirectVersion }
        elseif ($i -eq 3 -and $Mode -eq 1) { $VersionUrl = "$ProxyUrl/raw/main/typst.toml" }

        try {
            $toml = (Invoke-WebRequest -UseBasicParsing -TimeoutSec 10 $VersionUrl).Content
            $m = [regex]::Match($toml, '(?m)^\s*version\s*=\s*"([^"]+)"')
            if ($m.Success) {
                $Version = $m.Groups[1].Value
                break
            }
        } catch { Start-Sleep -Seconds 1 }
    }
}

if (-not $Version) {
    Write-Host "!! 无法获取版本号。您的网络环境访问 GitHub 极其不稳定。" -ForegroundColor Red
    Write-Host "   建议：开启代理软件（全局模式），或连接手机热点后重试。" -ForegroundColor Yellow
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

# 4. 下载源码包（交叉重试策略）
Write-Host "==> 正在下载模版..."
$DownloadSuccess = $false
for ($i = 1; $i -le 3; $i++) {
    if ($i -eq 2) {
        if ($Mode -eq 1) { $ZipUrl = $DirectZip }
        elseif ($Mode -eq 2) { $ZipUrl = $ProxyUrl }
        else { $ZipUrl = "$GhProxy/https://github.com/gbchu/ezexam/archive/refs/heads/main.zip" }
    } elseif ($i -eq 3) {
        if ($Mode -eq 1) { $ZipUrl = $ProxyUrl }
        elseif ($Mode -eq 2) { $ZipUrl = "$GhProxy/https://github.com/gbchu/ezexam/archive/refs/heads/main.zip" }
        else { $ZipUrl = $DirectZip }
    }

    try {
        Invoke-WebRequest -UseBasicParsing -TimeoutSec 30 -Uri $ZipUrl -OutFile $TmpZip
        $DownloadSuccess = $true
        break
    } catch { Start-Sleep -Seconds 1 }
}

if (-not $DownloadSuccess) {
    Write-Host "!! 下载失败。您的网络环境访问 GitHub 极其不稳定。" -ForegroundColor Red
    Write-Host "   建议：开启代理软件（全局模式），或连接手机热点后重试。" -ForegroundColor Yellow
    throw "下载失败"
}

# 5. 解压并导入
Write-Host "==> 导入模版 $Name@$Version 到 $Dest"

Expand-Archive -Path $TmpZip -DestinationPath $TmpDir -Force

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

Write-Host "✅ 模版导入成功！引用方式：" -ForegroundColor Green
Write-Host "   #import `"@$Namespace/$Name`:$Version`": *"