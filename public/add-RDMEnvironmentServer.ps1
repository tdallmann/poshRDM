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

function add-RDMEnvironmentServer($parentGroup, $envName, $serverName) {
    assert-RDMModuleLoaded
    #create server sessions withint the new environment group
    $server = New-RDMSession `
        -Name $serverName `
        -Type "RDPConfigured" `
        -Host $serverName
    $server.Group = "$parentGroup\$envName"
    Set-RDMSessionCredentials -CredentialsType Inherited -PSConnection $server
    Set-RDMSession $server
    Update-RDMUI
}