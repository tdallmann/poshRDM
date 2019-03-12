#######################
<#
.SYNOPSIS

.DESCRIPTION

.PARAMETER ParamName
 [int] The ParamName ...
 .OUTPUTS
none
.EXAMPLE

.NOTES
Author: Tim Dallmann - Jewelers Mutual Insurance Group 2019
#>
function assert-RDMModuleLoaded {
    if (!(Get-Module RemoteDesktopManager.PowerShellModule)){
        Import-Module "${env:ProgramFiles(x86)}\Devolutions\Remote Desktop Manager\RemoteDesktopManager.PowerShellModule.dll"
    }
}