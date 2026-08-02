param(
    [string]$Rom = "Freshly Picked - Tingle's Rosy Rupeeland (E)(FireX).nds",
    [string]$DsdExe = $env:DSD_EXE
)

$ErrorActionPreference = 'Stop'
$ExpectedSha256 = '72FE824D5FBA107BCE221EB85EEE4DA54295A9B1DFC47F5176ED7752A6F5006D'
$RepoRoot = Split-Path -Parent $PSScriptRoot
$RomPath = Join-Path $RepoRoot $Rom
$ExtractConfig = Join-Path $RepoRoot 'build\rom\config.yaml'
$OriginalRom = Join-Path $RepoRoot 'build\tingle.original.nds'
$DsdConfig = Join-Path $RepoRoot 'config\arm9\config.yaml'

if (-not $DsdExe) {
    $DsdCommand = Get-Command dsd -ErrorAction SilentlyContinue
    if ($DsdCommand) {
        $DsdExe = $DsdCommand.Source
    } elseif (Test-Path -LiteralPath 'E:\Stuff\Decomp\dsd.exe') {
        $DsdExe = 'E:\Stuff\Decomp\dsd.exe'
    }
}

if (-not $DsdExe -or -not (Test-Path -LiteralPath $DsdExe)) {
    throw 'dsd.exe was not found. Set DSD_EXE to its full path.'
}
if (-not (Test-Path -LiteralPath $RomPath)) {
    throw "ROM not found: $RomPath"
}

$ActualSha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $RomPath).Hash
if ($ActualSha256 -ne $ExpectedSha256) {
    throw "Unexpected ROM SHA-256: $ActualSha256"
}
Write-Host "Verified target ROM: $ActualSha256"

if (-not (Test-Path -LiteralPath $ExtractConfig)) {
    & $DsdExe rom extract --rom $RomPath --output-path (Join-Path $RepoRoot 'build\rom')
    if ($LASTEXITCODE -ne 0) { throw "dsd rom extract failed with exit code $LASTEXITCODE" }
} else {
    Write-Host 'Using existing build\rom extraction.'
}

& $DsdExe rom build --config $ExtractConfig --rom $OriginalRom
if ($LASTEXITCODE -ne 0) { throw "dsd rom build failed with exit code $LASTEXITCODE" }

& python (Join-Path $PSScriptRoot 'patch_rom_header.py') $RomPath $OriginalRom
if ($LASTEXITCODE -ne 0) { throw "header patch failed with exit code $LASTEXITCODE" }

$OriginalSha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $OriginalRom).Hash
if ($OriginalSha256 -ne $ExpectedSha256) {
    throw "Original-code ROM does not match: $OriginalSha256"
}
Write-Host "Exact original-code ROM verified: $OriginalSha256"

& $DsdExe delink --config-path $DsdConfig
if ($LASTEXITCODE -ne 0) { throw "dsd delink failed with exit code $LASTEXITCODE" }
Write-Host 'Reference delink objects are ready under build\decomp\delinks.'
