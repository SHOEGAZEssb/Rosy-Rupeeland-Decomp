[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$InputPath,
    [Parameter(Mandatory = $true)]
    [string]$ReplacementsPath,
    [Parameter(Mandatory = $true)]
    [string]$OutputPath
)

$ErrorActionPreference = 'Stop'
$RepoRoot = Split-Path -Parent $PSScriptRoot

function Normalize-LinkPath([string]$Path) {
    return $Path.Trim().Replace('\', '/').ToLowerInvariant()
}

$InputFullPath = [IO.Path]::GetFullPath((Join-Path $RepoRoot $InputPath))
$ReplacementsFullPath = [IO.Path]::GetFullPath((Join-Path $RepoRoot $ReplacementsPath))
$OutputFullPath = [IO.Path]::GetFullPath((Join-Path $RepoRoot $OutputPath))
$Objects = [Collections.Generic.List[string]](Get-Content -LiteralPath $InputFullPath)

foreach ($Line in Get-Content -LiteralPath $ReplacementsFullPath) {
    $Trimmed = $Line.Trim()
    if (-not $Trimmed -or $Trimmed.StartsWith('#')) {
        continue
    }

    $Parts = $Trimmed.Split('=', 2)
    if ($Parts.Count -ne 2) {
        throw "Invalid replacement (expected target = source): $Line"
    }

    $Target = Normalize-LinkPath $Parts[0]
    $Replacement = $Parts[1].Trim().Replace('/', '\')
    $ReplacementFullPath = [IO.Path]::GetFullPath((Join-Path $RepoRoot $Replacement))
    if (-not (Test-Path -LiteralPath $ReplacementFullPath -PathType Leaf)) {
        throw "Replacement object was not found: $ReplacementFullPath"
    }

    $Matches = @()
    for ($Index = 0; $Index -lt $Objects.Count; $Index++) {
        if ((Normalize-LinkPath $Objects[$Index]) -eq $Target) {
            $Matches += $Index
        }
    }
    if ($Matches.Count -ne 1) {
        throw "Expected exactly one '$($Parts[0].Trim())' entry, found $($Matches.Count)"
    }

    $Objects[$Matches[0]] = $Replacement
    Write-Host "Link replacement: $($Parts[0].Trim()) -> $($Parts[1].Trim())"
}

$OutputDirectory = Split-Path -Parent $OutputFullPath
$null = New-Item -ItemType Directory -Force -Path $OutputDirectory
Set-Content -LiteralPath $OutputFullPath -Value $Objects -Encoding ascii
