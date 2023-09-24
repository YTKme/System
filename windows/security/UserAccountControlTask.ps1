#
# Filename: UserAccountControl.ps1
#

[CmdletBinding()]

# Command Parameter
param (
    # Action
    [Parameter(Mandatory=$false)]
    [ValidateSet('New', 'Remove')]
    [string]$Action
)

$ErrorActionPreference = 'Stop'

$Filename = 'UserAccountControlTask.ps1'

Write-Verbose "Entering $Filename"

# Get Hostname
$Hostname = [System.Net.Dns]::GetHostName()

# Create Schedule Service Object
$ScheduleServiceObject = New-Object -ComObject schedule.service
# Connect Schedule Service Object
$ScheduleServiceObject.connect()

function Set-Task {
    [CmdletBinding(DefaultParameterSetName='New')]
    param(
        [Parameter(Mandatory=$false, ParameterSetName='New')]
        [switch]$New,
        [Parameter(Mandatory=$false, ParameterSetName='Remove')]
        [switch]$Remove
    )

    # New Task Scheduler Folder
    function New-Task-Scheduler-Folder {
        Write-Host "New Task Scheduler Folder" -ForegroundColor Cyan
        $RootFolder = $ScheduleServiceObject.GetFolder('\')
        $RootFolder.CreateFolder($Hostname)
        Write-Host "New Task Scheduler Folder Complete" -ForegroundColor Green
    }

    # Remove Task Scheduler Folder
    function Remove-Task-Scheduler-Folder {
        Write-Host "Remove Task Scheduler Folder" -ForegroundColor Cyan
        $RootFolder = $ScheduleServiceObject.GetFolder('\')
        $RootFolder.DeleteFolder($Hostname, $null)
        Write-Host "Remove Task Scheduler Folder Complete" -ForegroundColor Green
    }

    # New User Account Control Task
    function New-User-Account-Control-Task {
        New-Task-Scheduler-Folder
    }

    # Remove User Account Control Task
    function Remove-User-Account-Control-Task {
        Remove-Task-Scheduler-Folder
    }

    if ($New) {
        New-User-Account-Control-Task
    } elseif ($Remove) {
        Remove-User-Account-Control-Task
    }
}

# Execute User Account Control Task
if ($PSBoundParameters.ContainsKey('Action')) {
    $ActionParameter = @{ $Action = $true }
    Set-Task @ActionParameter
}

Write-Verbose "Leaving $Filename"
