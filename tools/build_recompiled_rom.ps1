[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$DsdExe,
    [Parameter(Mandatory = $true)]
    [string]$PythonExe,
    [string]$OutputRom = 'build/tingle.recompiled.nds'
)

$ErrorActionPreference = 'Stop'
$ExpectedSha256 = '72FE824D5FBA107BCE221EB85EEE4DA54295A9B1DFC47F5176ED7752A6F5006D'
$RepoRoot = Split-Path -Parent $PSScriptRoot
$DsdConfig = Join-Path $RepoRoot 'config\arm9\config.yaml'
$BaseRomTree = Join-Path $RepoRoot 'build\rom'
$LinkedModules = Join-Path $RepoRoot 'build\decomp\build'
$StageRomTree = Join-Path $RepoRoot 'build\recompiled-rom'
$ReferenceRom = Join-Path $RepoRoot "Freshly Picked - Tingle's Rosy Rupeeland (E)(FireX).nds"
$OutputRomPath = [IO.Path]::GetFullPath((Join-Path $RepoRoot $OutputRom))

if (-not (Test-Path -LiteralPath (Join-Path $BaseRomTree 'config.yaml'))) {
    throw 'The extracted ROM is missing. Run tools/bootstrap.ps1 first.'
}
if (-not (Test-Path -LiteralPath $ReferenceRom -PathType Leaf)) {
    throw "Reference ROM was not found: $ReferenceRom"
}

& $DsdExe check modules --config-path $DsdConfig --fail
if ($LASTEXITCODE -ne 0) {
    throw "Linked-module verification failed with exit code $LASTEXITCODE"
}

$null = New-Item -ItemType Directory -Force -Path $StageRomTree
Copy-Item -Path (Join-Path $BaseRomTree '*') -Destination $StageRomTree -Recurse -Force
Copy-Item -LiteralPath (Join-Path $LinkedModules 'arm9.bin') -Destination (Join-Path $StageRomTree 'arm9\arm9.bin') -Force
Copy-Item -LiteralPath (Join-Path $LinkedModules 'itcm.bin') -Destination (Join-Path $StageRomTree 'arm9\itcm.bin') -Force
Copy-Item -LiteralPath (Join-Path $LinkedModules 'dtcm.bin') -Destination (Join-Path $StageRomTree 'arm9\dtcm.bin') -Force

& $DsdExe rom build --config (Join-Path $StageRomTree 'config.yaml') --rom $OutputRomPath
if ($LASTEXITCODE -ne 0) {
    throw "ROM build failed with exit code $LASTEXITCODE"
}

& $PythonExe (Join-Path $PSScriptRoot 'patch_rom_header.py') $ReferenceRom $OutputRomPath
if ($LASTEXITCODE -ne 0) {
    throw "Header patch failed with exit code $LASTEXITCODE"
}

$ActualSha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $OutputRomPath).Hash
if ($ActualSha256 -ne $ExpectedSha256) {
    throw "Recompiled ROM does not match: $ActualSha256"
}

Write-Host "Recompiled ROM verified: $OutputRomPath"
Write-Host "SHA-256: $ActualSha256"
