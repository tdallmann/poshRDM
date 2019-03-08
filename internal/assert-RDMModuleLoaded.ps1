function assert-RDMModuleLoaded {
    if (!(Get-Module RemoteDesktopManager.PowerShellModule)){
        Import-Module "${env:ProgramFiles(x86)}\Devolutions\Remote Desktop Manager\RemoteDesktopManager.PowerShellModule.dll"
    }
}