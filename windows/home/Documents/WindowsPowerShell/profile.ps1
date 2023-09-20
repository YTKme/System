#
# Filename: profile.ps1
#

$ErrorActionPreference = 'Stop'

$Filename = 'profile.ps1'

Write-Verbose "Entering: $Filename"
Write-Host "Start Profile: $Filename" -ForegroundColor Cyan

# Write-Host 'Execute: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process'
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

# Import `posh-git` Module
Write-Host 'Execute: Import-Module posh-git'
Import-Module posh-git

Write-Host "End Profile: $Filename" -ForegroundColor Cyan
Write-Verbose "Leaving: $Filename"
