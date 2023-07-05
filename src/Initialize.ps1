<#
#̷𝓍   𝓐𝓡𝓢 𝓢𝓒𝓡𝓘𝓟𝓣𝓤𝓜
#̷𝓍   🇵​​​​​🇴​​​​​🇼​​​​​🇪​​​​​🇷​​​​​🇸​​​​​🇭​​​​​🇪​​​​​🇱​​​​​🇱​​​​​ 🇸​​​​​🇨​​​​​🇷​​​​​🇮​​​​​🇵​​​​​🇹​​​​​ 🇧​​​​​🇾​​​​​ 🇬​​​​​🇺​​​​​🇮​​​​​🇱​​​​​🇱​​​​​🇦​​​​​🇺​​​​​🇲​​​​​🇪​​​​​🇵​​​​​🇱​​​​​🇦​​​​​🇳​​​​​🇹​​​​​🇪​​​​​.🇶​​​​​🇨​​​​​@🇬​​​​​🇲​​​​​🇦​​​​​🇮​​​​​🇱​​​​​.🇨​​​​​🇴​​​​​🇲​​​​​
#>



function Uninitialize-VirusTotalModule{
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory=$true,Position=0)][String]$Password
    ) 
    $TestMode = $False

    if ( ($PSBoundParameters.ContainsKey('WhatIf') -Or($PSBoundParameters.ContainsKey('Test')))) {
        Write-Host '[Uninitialize-VirusTotalModule] ' -f DarkRed -NoNewLine
        Write-Host "TEST ONLY" -f DarkYellow            
        $TestMode = $True
        Set-VirusTotalServer '_' -WhatIf
        Set-VirusTotalDefaultUsername '_' -WhatIf
        Register-AppCredentials -Id (Get-VirusTotalUserCredentialID) -Username '_' -Password '_' -WhatIf
        Register-AppCredentials -Id (Get-VirusTotalAppCredentialID) -Username '_' -Password '_' -WhatIf
        return
    }
    Set-VirusTotalServer '_'
    Set-VirusTotalDefaultUsername '_'
    Register-AppCredentials -Id (Get-VirusTotalUserCredentialID) -Username '_' -Password '_'
    Register-AppCredentials -Id (Get-VirusTotalAppCredentialID) -Username '_' -Password '_'
} 



function Initialize-VirusTotalModule{
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory=$true,Position=0)][String]$Username,
        [Parameter(Mandatory=$true,Position=1)][String]$Email,
        [Parameter(Mandatory=$true,Position=2)][String]$ApiKey
    ) 
    Set-VirusTotalServer 'VirusTotal.com'
    Set-VirusTotalDefaultUsername $Username
    Register-AppCredentials -Id (Get-VirusTotalUserCredentialID) -Username $Username -Password '_'
    Register-AppCredentials -Id (Get-VirusTotalAppCredentialID) -Username $Email -Password $ApiKey


}
