#
# Filename: UserAccountControl.ps1
#

[CmdletBinding()]

# Command Parameter
param (
    # Notify
    [Parameter(Mandatory=$false)]
    [ValidateSet('Default', 'Always', 'Dim', 'NoDim', 'Never')]
    [string]$Notify
)

$ErrorActionPreference = 'Stop'

$Filename = 'UserAccountControl.ps1'

Write-Verbose "Entering $Filename"

# Default
$DefaultNotify = @{
    ConsentPromptBehaviorAdmin   = 5
    ConsentPromptBehaviorUser    = 3
    dontdisplaylastusername      = 0
    DSCAutomationHostEnabled     = 2
    EnableCursorSuppression      = 1
    EnableFullTrustStartupTasks  = 2
    EnableInstallerDetection     = 1
    EnableLUA                    = 1
    EnableSecureUIAPaths         = 1
    EnableUIADesktopToggle       = 0
    EnableUwpStartupTasks        = 2
    EnableVirtualization         = 1
    PromptOnSecureDesktop        = 1
    scforceoption                = 0
    shutdownwithoutlogon         = 1
    SupportFullTrustStartupTasks = 1
    SupportUwpStartupTasks       = 1
    undockwithoutlogon           = 1
    ValidateAdminCodeSignatures  = 0
}

# Always
$AlwaysNotify = @{
    ConsentPromptBehaviorAdmin   = 2
    ConsentPromptBehaviorUser    = 3
    dontdisplaylastusername      = 0
    DSCAutomationHostEnabled     = 2
    EnableCursorSuppression      = 1
    EnableFullTrustStartupTasks  = 2
    EnableInstallerDetection     = 1
    EnableLUA                    = 1
    EnableSecureUIAPaths         = 1
    EnableUIADesktopToggle       = 0
    EnableUwpStartupTasks        = 2
    EnableVirtualization         = 1
    PromptOnSecureDesktop        = 1
    scforceoption                = 0
    shutdownwithoutlogon         = 1
    SupportFullTrustStartupTasks = 1
    SupportUwpStartupTasks       = 1
    undockwithoutlogon           = 1
    ValidateAdminCodeSignatures  = 0
}

# No Dim
$NoDimNotify = @{
    ConsentPromptBehaviorAdmin   = 5
    ConsentPromptBehaviorUser    = 3
    dontdisplaylastusername      = 0
    DSCAutomationHostEnabled     = 2
    EnableCursorSuppression      = 1
    EnableFullTrustStartupTasks  = 2
    EnableInstallerDetection     = 1
    EnableLUA                    = 1
    EnableSecureUIAPaths         = 1
    EnableUIADesktopToggle       = 0
    EnableUwpStartupTasks        = 2
    EnableVirtualization         = 1
    PromptOnSecureDesktop        = 0
    scforceoption                = 0
    shutdownwithoutlogon         = 1
    SupportFullTrustStartupTasks = 1
    SupportUwpStartupTasks       = 1
    undockwithoutlogon           = 1
    ValidateAdminCodeSignatures  = 0
}

# Never
$NeverNotify = @{
    ConsentPromptBehaviorAdmin   = 0
    ConsentPromptBehaviorUser    = 3
    dontdisplaylastusername      = 0
    DSCAutomationHostEnabled     = 2
    EnableCursorSuppression      = 1
    EnableFullTrustStartupTasks  = 2
    EnableInstallerDetection     = 1
    EnableLUA                    = 1
    EnableSecureUIAPaths         = 1
    EnableUIADesktopToggle       = 0
    EnableUwpStartupTasks        = 2
    EnableVirtualization         = 1
    PromptOnSecureDesktop        = 0
    scforceoption                = 0
    shutdownwithoutlogon         = 1
    SupportFullTrustStartupTasks = 1
    SupportUwpStartupTasks       = 1
    undockwithoutlogon           = 1
    ValidateAdminCodeSignatures  = 0
}

function Set-Notify {
    [CmdletBinding(DefaultParameterSetName='Default')]
    param(
        [Parameter(Mandatory=$false, ParameterSetName='Default')]
        [switch]$Default,
        [Parameter(Mandatory=$false, ParameterSetName='Always')]
        [switch]$Always,
        [Parameter(Mandatory=$false, ParameterSetName='Dim')]
        [switch]$Dim,
        [Parameter(Mandatory=$false, ParameterSetName='NoDim')]
        [switch]$NoDim,
        [Parameter(Mandatory=$false, ParameterSetName='Never')]
        [switch]$Never
    )

    function Set-Notify-Always {
        Write-Host 'Set User Account Control Notify Always'
        Write-Host 'Set User Account Control Notify Always Complete'
    }

    # Default
    function Set-Notify-Dim {
        Write-Host 'Set User Account Control Notify Dim'
        Write-Host 'Set User Account Control Notify Dim Complete'
    }

    function Set-Notify-NoDim {
        Write-Host 'Set User Account Control Notify No Dim'
        Write-Host 'Set User Account Control Notify No Dim Complete'
    }

    function Set-Notify-Never {
        Write-Host 'Set User Account Control Notify Never'
        $NeverNotify.GetEnumerator() | ForEach-Object {
            Write-Host "Record: $($_.Key), $($_.Value)"
        }
        # Set-ItemProperty `
        # -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' `
        # -Name 'ConsentPromptBehaviorAdmin' `
        # -Value 0
        # Set-ItemProperty `
        # -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' `
        # -Name 'PromptOnSecureDesktop' `
        # -Value 0
        Write-Host 'Set User Account Control Notify Never Complete'
    }

    if ($Default) {
        Set-Notify-Dim
    } elseif ($Always) {
        Set-Notify-Always
    } elseif ($Dim) {
        Set-Notify-Dim
    } elseif ($NoDim) {
        Set-Notify-NoDim
    } elseif ($Never) {
        Set-Notify-Never
    }
}

# User Account Control Notify
if ($PSBoundParameters.ContainsKey('Notify')) {
    $NotifyParameter = @{ $Notify = $true }
    Set-Notify @NotifyParameter
}

Write-Verbose "Leaving $Filename"
