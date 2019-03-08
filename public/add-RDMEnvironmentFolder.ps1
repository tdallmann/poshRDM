function add-RDMEnvironmentFolder($parentGroup, $envName){
    assert-RDMModuleLoaded
    #Create the new Environment Group
    $newEnvGroup = New-RDMSession -Name $envName -Type "Group"
    $newEnvGroup.Group = "$parentGroup\$envname"
    Set-RDMSessionCredentials -CredentialsType Inherited -PSConnection $newEnvGroup
    $newEnvGroup.ImageName = 'SampleFolderBlue'
    $newEnvGroup.SortPriority = '30'
    Set-RDMSession $newEnvGroup
    Update-RDMUI
}