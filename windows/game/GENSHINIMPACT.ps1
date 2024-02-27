#
# Filename: GENSHINIMPACT.ps1
#

[CmdletBinding()]

# Command Parameter
param (
    # Priority
    [Parameter(Mandatory=$true)]
    [ValidateSet('Realtime', 'High', 'AboveNormal', 'Normal', 'BelowNormal', 'Low')]
    [string]$Priority
)

$ErrorActionPreference = 'Stop'

$Filename = 'GENSHINIMPACT.ps1'

Write-Verbose "Entering $Filename"

# Default
$DefaultPriority = @{
    CpuPriorityClass = 00000003
}

function Set-Priority {
}

# GENSHIN IMPACT Priority
if ($PSBoundParameters.ContainsKey('Priority')) {
    $PriorityParameter = @{ $Priority = $true }
    Set-Priority @PriorityParameter
}

Write-Verbose "Leaving $Filename"
