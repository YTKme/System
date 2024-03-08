#
# Filename: TaskPriority.ps1
#

[CmdletBinding()]

# Command Parameter
param (
    # Priority
    [Parameter(Mandatory=$false)]
    [ValidateSet('Default', 'Realtime', 'High', 'AboveNormal', 'Normal', 'BelowNormal', 'Low')]
    [string]$Priority
)

$ErrorActionPreference = 'Stop'

$Filename = 'TaskPriority.ps1'

Write-Verbose "Entering $Filename"

$RegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GenshinImpact.exe\PerfOptions'

# Low Priority
$LowPriority = @{
    CpuPriorityClass = 00000001
}

# Below Normal Priority
$BelowNormalPriority = @{
    CpuPriorityClass = 00000005
}

# Normal Priority
$NormalPriority = @{
    CpuPriorityClass = 00000002
}

# Above Normal Priority
$AboveNormalPriority = @{
    CpuPriorityClass = 00000006
}

# High Priority
$HighPriority = @{
    CpuPriorityClass = 00000003
}

function Set-Registry-Data {
    param (
        # Path
        [Parameter(Mandatory=$true)]
        [string]$Path,
        # Data
        [Parameter(Mandatory=$true)]
        [hashtable]$Data
    )

    Write-Verbose "Path: $Path"
    $Data.GetEnumerator() | ForEach-Object {
        Write-Verbose "Name: $($_.Key), Data: $($_.Value)"
    }

    if (-Not (Test-Path -Path $Path)) {
        # Create Registry Path
        New-Item -Path $RegistryPath -Force
        $Data.GetEnumerator() | ForEach-Object {
            New-ItemProperty -Path $Path -Name $_.Key -Value $_.Value
        }
    } else {
        if ($Path.GetValueNames() -notcontains $_.Key) {
            $Data.GetEnumerator() | ForEach-Object {
                New-ItemProperty -Path $Path -Name $_.Key -Value $_.Value
            }
        } else {
            $Data.GetEnumerator() | ForEach-Object {
                Set-ItemProperty -Path $Path -Name $_.Key -Value $_.Value
            }
        }
    }
}

function Set-Priority {
    [CmdletBinding(DefaultParameterSetName='Default')]
    param(
        [Parameter(Mandatory=$false, ParameterSetName='Default')]
        [switch]$Default,
        [Parameter(Mandatory=$false, ParameterSetName='Low')]
        [switch]$Low,
        [Parameter(Mandatory=$false, ParameterSetName='BelowNormal')]
        [switch]$BelowNormal,
        [Parameter(Mandatory=$false, ParameterSetName='Normal')]
        [switch]$Normal,
        [Parameter(Mandatory=$false, ParameterSetName='AboveNormal')]
        [switch]$AboveNormal,
        [Parameter(Mandatory=$false, ParameterSetName='High')]
        [switch]$High
    )

    # Default
    function Set-Priority-Default {
        Write-Host 'Set GENSHIN IMPACT Priority Default' -ForegroundColor Cyan
        Write-Host 'Test'
        Write-Host 'Set GENSHIN IMPACT Priority Default Complete' -ForegroundColor Green
    }

    function Set-Priority-Low {
        Write-Host 'Set GENSHIN IMPACT Priority Low' -ForegroundColor Cyan
        Set-Registry-Data -Path $RegistryPath -Data $LowPriority
        Write-Host 'Set GENSHIN IMPACT Priority Low Complete' -ForegroundColor Green
    }

    function Set-Priority-BelowNormal {
        Write-Host 'Set GENSHIN IMPACT Priority Below Normal' -ForegroundColor Cyan
        Set-Registry-Data -Path $RegistryPath -Data $BelowNormalPriority
        Write-Host 'Set GENSHIN IMPACT Priority Below Normal Complete' -ForegroundColor Green
    }

    function Set-Priority-Normal {
        Write-Host 'Set GENSHIN IMPACT Priority Normal' -ForegroundColor Cyan
        Set-Registry-Data -Path $RegistryPath -Data $NormalPriority
        Write-Host 'Set GENSHIN IMPACT Priority Normal Complete' -ForegroundColor Green
    }

    function Set-Priority-AboveNormal {
        Write-Host 'Set GENSHIN IMPACT Priority Above Normal' -ForegroundColor Cyan
        Set-Registry-Data -Path $RegistryPath -Data $AboveNormalPriority
        Write-Host 'Set GENSHIN IMPACT Priority Above Normal Complete' -ForegroundColor Green
    }

    function Set-Priority-High {
        Write-Host 'Set GENSHIN IMPACT Priority High' -ForegroundColor Cyan
        Set-Registry-Data -Path $RegistryPath -Data $HighPriority
        Write-Host 'Set GENSHIN IMPACT Priority High Complete' -ForegroundColor Green
    }

    if ($Default) {
        Set-Priority-Default
    } elseif ($Low) {
        Set-Priority-Low
    } elseif ($BelowNormal) {
        Set-Priority-BelowNormal
    } elseif ($Normal) {
        Set-Priority-Normal
    } elseif ($AboveNormal) {
        Set-Priority-AboveNormal
    } elseif ($High) {
        Set-Priority-High
    }
}

# GENSHIN IMPACT Priority
if ($PSBoundParameters.ContainsKey('Priority')) {
    $PriorityParameter = @{ $Priority = $true }
    Set-Priority @PriorityParameter
}

Write-Verbose "Leaving $Filename"
