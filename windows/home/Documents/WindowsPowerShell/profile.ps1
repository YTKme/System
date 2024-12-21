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

# Profile
Write-Verbose 'Alias: newdesktop'
New-Alias -Name newdesktop -Value New-Desktop

# WSL VPN
# Write-Verbose 'Alias: wslvpn'
# New-Alias -Name wslvpn -Value "$env:USERPROFILE\Documents\WindowsPowerShell\WSL-VPN.ps1"

# Change Directory
Write-Verbose 'Alias: cdrepository'
New-Alias -Name cdrepository -Value Set-Location-Repository

# Git Configuration
Write-Verbose 'Alias: gcself'
New-Alias -Name gcself -Value Set-Git-Configuration-self
Write-Verbose 'Alias: glaogd'
New-Alias -Name glaogd -Value Get-Git-Log-All-Oneline-Graph-Decorate

############
# Function #
############

# New Desktop
Write-Verbose 'Function: New-Desktop'
function New-Desktop {
    $StartingDirectory = "$env:USERPROFILE\Desktop"
    $ArgumentList = @(
        "--window 0",
        "new-tab",
        "--title `"Desktop`"",
        "--profile `"Windows PowerShell`"",
        "--startingDirectory `"$StartingDirectory`";",
        "split-pane --vertical --duplicate;",
        "split-pane --horizontal --duplicate;",
        "move-focus first"
    ) -join ' '
    Start-Process wt -ArgumentList $ArgumentList
    # wt `
    #     --window 0 new-tab `
    #     --title "Desktop" `
    #     --profile "Windows PowerShell" `
    #     --startingDirectory "$env:USERPROFILE\Desktop" `
    #     split-pane --vertical --duplicate `
    #     split-pane --horizontal --duplicate `
    #     move-focus first
}

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

Write-Verbose 'Function: Get-Git-Log-All-Oneline-Graph-Decorate'
Function Get-Git-Log-All-Oneline-Graph-Decorate {
    git log --all --oneline --graph --decorate
}

Write-Host "End Profile: $Filename" -ForegroundColor Cyan
Write-Verbose "Leaving: $Filename"
