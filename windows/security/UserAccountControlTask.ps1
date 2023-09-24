#
# Filename: UserAccountControl.ps1
#

[CmdletBinding()]

# Command Parameter
param (
    # Action
    [Parameter(Mandatory=$false)]
    [ValidateSet('Create', 'Delete')]
    [string]$Action
)

$ErrorActionPreference = 'Stop'

$Filename = 'UserAccountControlTask.ps1'

Write-Verbose "Entering $Filename"

# Get Hostname
$Hostname = [System.Net.Dns]::GetHostName()

# Create Schedule Service Object
$ScheduleServiceObject = New-Object -ComObject schedule.service

# Create Task Scheduler Folder
function New-Task-Scheduler-Folder {
    $ScheduleServiceObject.connect()
    $RootFolder = $ScheduleServiceObject.GetFolder('\')
    $RootFolder.CreateFolder($Hostname)
}

# Delete Task Scheduler Folder
function Remove-Task-Scheduler--Folder {

}

# Create User Account Control Task
function New-User-Account-Control-Task {

}

function Remove-User-Account-Control-Task {

}

# Delete User Account Control Task

Write-Verbose "Leaving $Filename"