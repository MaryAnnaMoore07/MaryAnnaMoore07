<#
.SYNOPSIS
 Configures the "Enforce password history" policy to require 24 unique passwords on Windows 10.

.NOTES
    Author          : MaryAnna Moore
    LinkedIn        : linkedin.com/in/maryanna-moore/
    GitHub          : github.com/MaryAnnaMoore07
    Date Created    : 2025-08-04
    Last Modified   : 2025-08-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.DESCRIPTION
This script sets the local password policy to remember the last 24 passwords, preventing reuse. 
It enforces a key STIG compliance requirement for credential hygiene and user account security.

.EXAMPLE
PS C:\> .\WN10-AC-000020.ps1

Sets the password history length to 24 using 'net accounts'.
#>

# Must be run as Administrator

# Define the desired password history value
$desiredValue = 24

# Run the policy update using net accounts
Write-Output "Applying password history policy: Enforce last $desiredValue passwords remembered..."
Start-Process -FilePath "net" -ArgumentList "accounts /uniquepw:$desiredValue" -NoNewWindow -Wait

# Verify and display the result
Write-Output "`nVerifying setting..."
$result = (net accounts | Select-String "Password history length")
Write-Output $result

# Optional logging (uncomment to enable)
# $logPath = "$env:USERPROFILE\Desktop\PasswordPolicyLog.txt"
# "[$(Get-Date)] Enforce password history set to $desiredValue" | Out-File -FilePath $logPath -Append
