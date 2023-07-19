#
# Filename: DeviceInstallationSetting.ps1
#

[CmdletBinding()]

# Command Parameter
param (
    # Notify
    [Parameter(Mandatory=$false)]
    [ValidateSet('Default', 'Always', 'Dim', 'NoDim', 'Never')]
    [string]$Notify
)
