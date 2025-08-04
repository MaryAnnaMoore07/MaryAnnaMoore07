<#
.SYNOPSIS
   Configures Windows 10 audit policy to enable logging of "Other Logon/Logoff Events – Failure" and enforces the use of advanced audit subcategory settings. This supports forensic analysis, troubleshooting, and detection of suspicious user activity by maintaining a detailed audit trail of system activity.

.NOTES
    Author          : MaryAnna Moore
    LinkedIn        : linkedin.com/in/maryanna-moore/
    GitHub          : github.com/MaryAnnaMoore07
    Date Created    : 2025-08-04
    Last Modified   : 2025-08-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000565

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
   PS C:\> WIN10-AU-00565.ps1

Runs the script and applies the required registry and audit policy settings.
Must be run from an elevated (Administrator) PowerShell session.
#>


Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "SCENoApplyLegacyAuditPolicy" -Value 1 -Type DWord; 
AuditPol /set /subcategory:"Other Logon/Logoff Events" /failure:enable
