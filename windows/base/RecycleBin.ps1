#
# Filename: RecycleBin.ps1
#

[CmdletBinding()]

# Command Parameter
param (
    # State
    [Parameter(Mandatory=$true)]
    [ValidateSet('Default', 'Show', 'Hide')]
    [string]$State
)

$ErrorActionPreference = 'Stop'

$Filename = 'RecycleBin.ps1'

Write-Verbose "Entering $Filename"

# Default
$DefaultState = @{
    ConsentPromptBehaviorAdmin = 5
}

Write-Verbose "Leaving $Filename"
