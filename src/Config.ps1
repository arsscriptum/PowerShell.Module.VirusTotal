<#
#̷𝓍   𝓐𝓡𝓢 𝓢𝓒𝓡𝓘𝓟𝓣𝓤𝓜
#̷𝓍   🇵​​​​​🇴​​​​​🇼​​​​​🇪​​​​​🇷​​​​​🇸​​​​​🇭​​​​​🇪​​​​​🇱​​​​​🇱​​​​​ 🇸​​​​​🇨​​​​​🇷​​​​​🇮​​​​​🇵​​​​​🇹​​​​​ 🇧​​​​​🇾​​​​​ 🇬​​​​​🇺​​​​​🇮​​​​​🇱​​​​​🇱​​​​​🇦​​​​​🇺​​​​​🇲​​​​​🇪​​​​​🇵​​​​​🇱​​​​​🇦​​​​​🇳​​​​​🇹​​​​​🇪​​​​​.🇶​​​​​🇨​​​​​@🇬​​​​​🇲​​​​​🇦​​​​​🇮​​​​​🇱​​​​​.🇨​​​​​🇴​​​​​🇲​​​​​
#>


function Get-VirusTotalUserCredentialID { 
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage="Overwrite if present")]
        [String]$Id
    )

    $DefaultUser = Get-VirusTotalDefaultUsername
    $Credz = "OpenAI_MODULE_USER_$DefaultUser"

    $DevAccount = Get-VirusTotalDevAccountOverride
    if($DevAccount){ return "OpenAI_MODULE_USER_$DevAccount" }
    
    return $Credz
}

function Get-VirusTotalAppCredentialID { 
    [CmdletBinding(SupportsShouldProcess)]
    param()
    $DefaultUser = Get-VirusTotalDefaultUsername
    $Credz = "OpenAI_MODULE_APP_$DefaultUser"

    $DevAccount = Get-VirusTotalDevAccountOverride
    if($DevAccount){ return "OpenAI_MODULE_APP_$DevAccount" }
    
    return $Credz
}

function Get-VirusTotalDevAccountOverride { 
    [CmdletBinding(SupportsShouldProcess)]
    param()

    $RegPath = Get-VirusTotalModuleRegistryPath
    if( $RegPath -eq "" ) { throw "not in module"; return ;}
    $DevAccount = ''
    $DevAccountOverride = Test-RegistryValue -Path "$RegPath" -Entry 'override_dev_account'
    if($DevAccountOverride){
        $DevAccount = Get-RegistryValue -Path "$RegPath" -Entry 'override_dev_account'
    }
    
    return $DevAccount
}

function Set-VirusTotalDevAccountOverride { 
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory=$false, ValueFromPipeline=$true, HelpMessage="Overwrite if present")]
        [String]$Id
    )

    $RegPath = Get-VirusTotalModuleRegistryPath
    if( $RegPath -eq "" ) { throw "not in module"; return ;}
    New-RegistryValue -Path "$RegPath" -Entry 'override_dev_account' -Value "$Id" 'String'
    Set-RegistryValue -Path "$RegPath" -Entry 'override_dev_account' -Value "$Id"
    
    return $DevAccount
}

function Get-VirusTotalModuleUserAgent { 
    [CmdletBinding(SupportsShouldProcess)]
    param ()
    $ModuleName = ($ExecutionContext.SessionState).Module
    $Agent = "User-Agent $ModuleName. Custom Module."
   
    return $Agent
}


function Set-VirusTotalDefaultUsername {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage="Git Username")]
        [String]$User      
    )
    $RegPath = Get-VirusTotalModuleRegistryPath
    $ok = Set-RegistryValue  "$RegPath" "default_username" "$User"
    [environment]::SetEnvironmentVariable('DEFAULT_OpenAI_USERNAME',"$User",'User')
    return $ok
}

<#
    OpenAIDefaultUsername
    New-ItemProperty -Path "$ENV:OrganizationHKCU\OpenAI.com" -Name 'default_username' -Value 'codecastor'
 #>
function Get-VirusTotalDefaultUsername {
    [CmdletBinding(SupportsShouldProcess)]
    param ()
    $RegPath = Get-VirusTotalModuleRegistryPath
    $User = (Get-ItemProperty -Path "$RegPath" -Name 'default_username' -ErrorAction Ignore).default_username
    if( $User -ne $null ) { return $User  }
    if( $Env:DEFAULT_OpenAI_USERNAME -ne $null ) { return $Env:DEFAULT_OpenAI_USERNAME ; }
    return $null
}


function Set-VirusTotalServer {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage="Git Server")]
        [String]$Hostname      
    )
    $RegPath = Get-VirusTotalModuleRegistryPath
    $ok = Set-RegistryValue  "$RegPath" "hostname" "$Hostname"
    [environment]::SetEnvironmentVariable('DEFAULT_OpenAI_SERVER',"$Hostname",'User')
    return $ok
}


function Get-VirusTotalServer {      
    [CmdletBinding(SupportsShouldProcess)]
    param ()$Script:MyInvocation.MyCommand.Name
    $RegPath = Get-VirusTotalModuleRegistryPath
    $Server = (Get-ItemProperty -Path "$RegPath" -Name 'hostname' -ErrorAction Ignore).hostname
    if( $Server -ne $null ) { return $Server }
     
    if( $Env:DEFAULT_OpenAI_SERVER -ne $null ) { return $Env:DEFAULT_OpenAI_SERVER  }
    return $null
}


function Test-VirusTotalModuleConfig { 
    $OpenAIModuleInformation    = Get-VirusTotalModuleInformation;
    $hash = @{ OpenAIServer               = Get-VirusTotalServer;
    OpenAIDefaultUsername      = Get-VirusTotalDefaultUsername;
    OpenAIModuleUserAgent      = Get-VirusTotalModuleUserAgent;
    OpenAIDevAccountOverride   = Get-VirusTotalDevAccountOverride;
    OpenAIUserCredentialID     = Get-VirusTotalUserCredentialID;
    OpenAIAppCredentialID      = Get-VirusTotalAppCredentialID;
    RegistryRoot               = $OpenAIModuleInformation.RegistryRoot;
    ModuleSystemPath           = $OpenAIModuleInformation.ModuleSystemPath;
    ModuleInstallPath          = $OpenAIModuleInformation.ModuleInstallPath;
    ModuleName                 = $OpenAIModuleInformation.ModuleName;
    ScriptName                 = $OpenAIModuleInformation.ScriptName;
    ModulePath                 = $OpenAIModuleInformation.ModulePath; } 

    Write-Host "---------------------------------------------------------------------" -f DarkRed
    $hash.GetEnumerator() | ForEach-Object {
        $k = $($_.Key) ; $kl = $k.Length ; if($kl -lt 30){ $diff =30 - $kl ; for($i=0;$i -lt $diff ; $i++) { $k += ' '; }}
        Write-Host "$k" -n -f DarkRed
        Write-Host "$($_.Value)" -f DarkYellow
    }
    Write-Host "---------------------------------------------------------------------" -f DarkRed
}

function Get-VirusTotalModuleRegistryPath { 
    [CmdletBinding(SupportsShouldProcess)]
    param ()
    if( $ExecutionContext -eq $null ) { throw "not in module"; return "" ; }
    $ModuleName = ($ExecutionContext.SessionState).Module
    if(-not($ModuleName)){$ModuleName = "PowerShell.Module.OpenAI"}
    $Path = "$ENV:OrganizationHKCU\$ModuleName"
   
    return $Path
}

function Get-VirusTotalModuleInformation{
    [CmdletBinding()]
    param ()
    try{
        if( $ExecutionContext -eq $null ) { throw "not in module"; return "" ; }
        $ModuleName = $ExecutionContext.SessionState.Module
        $ModuleScriptPath = $Script:MyInvocation.MyCommand.Path
        $ModuleInstallPath = (Get-Item "$ModuleScriptPath").DirectoryName
        $CurrentScriptName = $MyInvocation.MyCommand.Name
        $RegistryPath = "$ENV:OrganizationHKCU\$ModuleName"
        $ModuleSystemPath = (Resolve-Path "$ModuleInstallPath\..").Path
        $ModuleInformation = @{
            ModuleName        = $ModuleName
            ModulePath        = $ModuleScriptPath
            ScriptName        = $CurrentScriptName
            RegistryRoot      = $RegistryPath
            ModuleSystemPath  = $ModuleSystemPath
            ModuleInstallPath = $ModuleInstallPath
        }
        return $ModuleInformation        
    }catch{
        Show-ExceptionDetails $_ -ShowStack
    }
}
