<#
.SYNOPSIS
  Configures a power policy setting in the Windows registry to set 'ACSettingIndex' to 1 under PowerSettings.

.NOTES
    Author          : MaryAnna Moore
    LinkedIn        : linkedin.com/in/maryanna-moore/
    GitHub          : github.com/MaryAnnaMoore07
    Date Created    : 2025-08-04
    Last Modified   : 2025-08-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000150

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.DESCRIPTION
This script creates or updates the registry key:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\
and sets the DWORD value 'ACSettingIndex' to 1. This may be used to enforce power management policy settings
via Group Policy or local configuration to meet organizational compliance or energy-saving standards.

.PARAMETER None
This script takes no parameters.

.EXAMPLE
PS C:\> .\WN10-CC-000150.ps1

Runs the script to create or update the registry value as described.
#>

# Must be run as Administrator

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"

# Create the registry key if it doesn't exist
if (-not (Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the ACSettingIndex value to 1 (REG_DWORD)
Set-ItemProperty -Path $regPath -Name "ACSettingIndex" -Value 1 -Type DWord
