#
# Filename: LongPathsEnabled.ps1
#

[CmdletBinding()]

# Command Parameter
param (
    # Default
    [Parameter(Mandatory=$false)]
    [switch]$Default,
    # Enable
    [Parameter(Mandatory=$false)]
    [switch]$Enable
)

$ErrorActionPreference = 'Stop'

$Filename = 'LongPathsEnabled.ps1'

Write-Verbose "Entering $Filename"

$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem\LongPathsEnabled'

function Set-Long-Path-Enable {

}

# Execute
if ($PSBoundParameters.ContainsKey('Enable')) {
    Write-Host "Enable LongPaths"
} elseif ($PSBoundParameters.ContainsKey('Default')) {
    Write-Host "Default LongPaths"
}

Write-Verbose "Leaving $Filename"
