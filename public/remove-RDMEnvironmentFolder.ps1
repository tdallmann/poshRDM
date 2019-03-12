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

function remove-RDMEnvironmentFolder
(
    $name,
    $parentGroup = 'Application / Service Servers'
)
{
    Assert-RDMModuleLoaded
    $existingSessions = Get-RDMSession | Where-Object -Property Group -eq "$parentGroup\$name"
    foreach ($session in $existingSessions) {
        Remove-RDMSession -ID $session.ID -Force
    }
    Update-RDMUI
}