#
# Filename: General.ps1
#

[CmdletBinding()]

# Command Parameter
param ()

$ErrorActionPreference = 'Stop'

$Filename = 'General.ps1'

function Set-Recycle-Bin {
    param(
        [switch]$Show,
        [switch]$Hide
    )
}

Write-Verbose "Entering $Filename"

Write-Verbose "Leaving $Filename"