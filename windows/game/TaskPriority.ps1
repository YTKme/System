#
# Filename: GENSHINIMPACT.ps1
#

[CmdletBinding()]

# Command Parameter
param (
    # Priority
    [Parameter(Mandatory=$true)]
    [ValidateSet('Default', 'Realtime', 'High', 'AboveNormal', 'Normal', 'BelowNormal', 'Low')]
    [string]$Priority
)

$ErrorActionPreference = 'Stop'

$Filename = 'GENSHINIMPACT.ps1'

Write-Verbose "Entering $Filename"

$PriorityPath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GenshinImpact.exe\PerfOptions'

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
        $LowPriority.GetEnumerator() | ForEach-Object {
            Write-Host "Set Item Property: $($_.Key), $($_.Value)"
            Set-ItemProperty `
            -Path $PriorityPath `
            -Name $_.Key `
            -Value $_.Value
        }
        Write-Host 'Set GENSHIN IMPACT Priority Low Complete' -ForegroundColor Green
    }

    function Set-Priority-BelowNormal {
        Write-Host 'Set GENSHIN IMPACT Priority Below Normal' -ForegroundColor Cyan
        $BelowNormalPriority.GetEnumerator() | ForEach-Object {
            Write-Host "Set Item Property: $($_.Key), $($_.Value)"
            Set-ItemProperty `
            -Path $PriorityPath `
            -Name $_.Key `
            -Value $_.Value
        }
        Write-Host 'Set GENSHIN IMPACT Priority Below Normal Complete' -ForegroundColor Green
    }

    function Set-Priority-Normal {
        Write-Host 'Set GENSHIN IMPACT Priority Normal' -ForegroundColor Cyan
        $NormalPriority.GetEnumerator() | ForEach-Object {
            Write-Host "Set Item Property: $($_.Key), $($_.Value)"
            Set-ItemProperty `
            -Path $PriorityPath `
            -Name $_.Key `
            -Value $_.Value
        }
        Write-Host 'Set GENSHIN IMPACT Priority Normal Complete' -ForegroundColor Green
    }

    function Set-Priority-AboveNormal {
        Write-Host 'Set GENSHIN IMPACT Priority Above Normal' -ForegroundColor Cyan
        $AboveNormalPriority.GetEnumerator() | ForEach-Object {
            Write-Host "Set Item Property: $($_.Key), $($_.Value)"
            Set-ItemProperty `
            -Path $PriorityPath `
            -Name $_.Key `
            -Value $_.Value
        }
        Write-Host 'Set GENSHIN IMPACT Priority Above Normal Complete' -ForegroundColor Green
    }

    function Set-Priority-High {
        Write-Host 'Set GENSHIN IMPACT Priority High' -ForegroundColor Cyan
        $Name = 'CpuPriorityClass'
        if (-Not (Test-Path -Path $PriorityPath)) {
            $HighPriority.GetEnumerator() | ForEach-Object {
                Write-Host "New Item Property: $($_.Key), $($_.Value)"
                New-ItemProperty `
                -Path $PriorityPath `
                -Name $_.Key `
                -Value $_.Value
            }
        } else {
            Write-Host "Path: $PriorityPath" -ForegroundColor Cyan
            New-Item -Path $PriorityPath -Force
            $HighPriority.GetEnumerator() | ForEach-Object {
                Write-Host "New Item Property: $($_.Key), $($_.Value)"
                New-ItemProperty `
                -Path $PriorityPath `
                -Name $_.Key `
                -Value $_.Value
            }
        }
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
