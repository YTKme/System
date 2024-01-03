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
# Write-Verbose 'Module: posh-git'
# Import-Module posh-git

#########
# Alias #
#########

# WSL VPN
# Write-Verbose 'Alias: wslvpn'
# New-Alias -Name wslvpn -Value "$env:USERPROFILE\Documents\WindowsPowerShell\WSL-VPN.ps1"

# Change Directory
Write-Verbose 'Alias: cdrepository'
New-Alias -Name cdrepository -Value Set-Location-Repository

# Git Configuration
Write-Verbose 'Alias: gcself'
New-Alias -Name gcself -Value Set-Git-Configuration-self

############
# Function #
############

# Change Directory
# Write-Verbose 'Function: Set-Location-Repository'
# Function Set-Location-Repository {
#     Set-Location -Path $env:USERPROFILE\Desktop\Project\Repository\
# }

# Git Configuration
Write-Verbose 'Function: Set-Git-Configuration-self'
Function Set-Git-Configuration-self {
    git config core.filemode false
    git config user.email "email@localhost.lcl"
    git config user.name "Self"
    git config core.eol lf
    git config core.autocrlf input
}

Write-Host "End Profile: $Filename" -ForegroundColor Cyan
Write-Verbose "Leaving: $Filename"
