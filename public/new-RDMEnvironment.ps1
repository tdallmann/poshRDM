function new-RDMEnvironment
(
    $name,
    $serverNameStyle,
    [string[]]$serverTypes,
    $parentGroup = 'Application / Service Servers'
)
{
    $envNumber = $name.Substring($name.length - 2)
    remove-RDMEnvironmentFolder $parentGroup $name
    add-RDMEnvironmentFolder $parentGroup $name
    foreach ($type in $serverTypes){
        if($serverNameStyle -eq 'legacy'){
            $serverName = "jmt$type$envNumber"
        } else {
            $serverName = "jtn-vm-$type$envNumber"
        }
        add-RDMEnvironmentServer $parentGroup $name $serverName
    }
}