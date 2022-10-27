#
# Filename: General.ps1
#

[CmdletBinding()]

# Command Parameter
param (
    # Recycle Bin
    [Parameter(Mandatory=$false)]
    [ValidateSet('Default', 'Show', 'Hide')]
    [string]$RecycleBin,
    # All
    [Parameter(Mandatory=$false)]
    [ValidateSet('Default', 'Recommend')]
    [string]$All
)

$ErrorActionPreference = 'Stop'

$Filename = 'General.ps1'

function Set-Recycle-Bin {
    [CmdletBinding(DefaultParameterSetName='Default')]
    param(
        [Parameter(Mandatory=$false, ParameterSetName='Default')]
        [switch]$Default,
        [Parameter(Mandatory=$false, ParameterSetName='Show')]
        [switch]$Show,
        [Parameter(Mandatory=$false, ParameterSetName='Hide')]
        [switch]$Hide
    )

    function Set-Recycle-Bin-Default {
        Write-Host 'Recycle Bin Default'
    }

    if ($Default) {
        Set-Recycle-Bin-Default
    } elseif ($Show) {
        Set-Recycle-Bin-Default
    } elseif ($Hide) {
        Write-Host 'Recycle Bin Hide'
    }
}

Write-Verbose "Entering $Filename"

# Recycle Bin
if ($PSBoundParameters.ContainsKey('RecycleBin')) {
    $RecycleBinParameter = @{ $RecycleBin = $true }
    Set-Recycle-Bin @RecycleBinParameter
}

if ($PSBoundParameters.ContainsKey('All')) {
    Write-Host 'All'
    Get-Variable
}

Write-Verbose "Leaving $Filename"
