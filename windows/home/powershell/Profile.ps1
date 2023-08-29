#
# Filename: Profile.ps1
#

$ErrorActionPreference = 'Stop'

$Filename = 'Profile.ps1'

Write-Verbose "Entering $Filename"
Write-Host "Start Profile" -ForegroundColor Cyan

# Write-Host 'Execute `Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process`'
# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

Write-Host "End Profile" -ForegroundColor Cyan
Write-Verbose "Leaving $Filename"