#
# Filename: SetUp.ps1
#

[CmdletBinding()]

# Command Parameter
param (
    # Show Color
    [Parameter(Mandatory = $false)]
    [switch]$ShowColor
)

$ErrorActionPreference = 'Stop'

$Filename = 'SetUp.ps1'

Write-Verbose "Entering $Filename"

# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

function Show-Color {
    Write-Host 'Color Test: Black (Do Not Use)' -ForegroundColor Black
    Write-Host 'Color Test: Dark Blue (Do Not Use)' -ForegroundColor DarkBlue
    Write-Host 'Color Test: Dark Green' -ForegroundColor DarkGreen
    Write-Host 'Color Test: Dark Cyan' -ForegroundColor DarkCyan
    Write-Host 'Color Test: Dark Red' -ForegroundColor DarkRed
    Write-Host 'Color Test: Dark Magenta (Do Not Use)' -ForegroundColor DarkMagenta
    Write-Host 'Color Test: Dark Yellow' -ForegroundColor DarkYellow
    Write-Host 'Color Test: Gray' -ForegroundColor Gray
    Write-Host 'Color Test: Dark Gray' -ForegroundColor DarkGray
    Write-Host 'Color Test: Blue (Do Not Use)' -ForegroundColor Blue
    Write-Host 'Color Test: Green' -ForegroundColor Green
    Write-Host 'Color Test: Cyan' -ForegroundColor Cyan
    Write-Host 'Color Test: Red' -ForegroundColor Red
    Write-Host 'Color Test: Magenta' -ForegroundColor Magenta
    Write-Host 'Color Test: Yellow' -ForegroundColor Yellow
    Write-Host 'Color Test: White' -ForegroundColor White
}

function Show-Computer {
    Write-Host "Core: $((Get-CimInstance Win32_Processor).NumberOfCores)"
    Write-Host "Processor: $((Get-CimInstance Win32_Processor).NumberOfLogicalProcessors)"
}

if ($ShowColor) { Show-Color }

Write-Verbose "Leaving $Filename"
