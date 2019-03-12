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
function add-RDMEnvironmentFolder {
    [cmdletbinding()]
    PARAM(
        [string]$name,
        [string]$parentGroup = 'Application / Service Servers'
    )
    assert-RDMModuleLoaded
    #Create the new Environment Group
    $newEnvGroup = New-RDMSession -Name $name -Type "Group"
    $newEnvGroup.Group = "$parentGroup\$name"
    Set-RDMSessionCredentials -CredentialsType Inherited -PSConnection $newEnvGroup
    $newEnvGroup.ImageName = 'SampleFolderBlue'
    $newEnvGroup.SortPriority = '30'
    Set-RDMSession $newEnvGroup
    Update-RDMUI
}