<#
#̷𝓍   𝓐𝓡𝓢 𝓢𝓒𝓡𝓘𝓟𝓣𝓤𝓜
#̷𝓍   🇵​​​​​🇴​​​​​🇼​​​​​🇪​​​​​🇷​​​​​🇸​​​​​🇭​​​​​🇪​​​​​🇱​​​​​🇱​​​​​ 🇸​​​​​🇨​​​​​🇷​​​​​🇮​​​​​🇵​​​​​🇹​​​​​ 🇧​​​​​🇾​​​​​ 🇬​​​​​🇺​​​​​🇮​​​​​🇱​​​​​🇱​​​​​🇦​​​​​🇺​​​​​🇲​​​​​🇪​​​​​🇵​​​​​🇱​​​​​🇦​​​​​🇳​​​​​🇹​​​​​🇪​​​​​.🇶​​​​​🇨​​​​​@🇬​​​​​🇲​​​​​🇦​​​​​🇮​​​​​🇱​​​​​.🇨​​​​​🇴​​​​​🇲​​​​​
#>


function Get-VirusTotalAuthenticationHeader{
    [CmdletBinding(SupportsShouldProcess)]
    param() 

    try{

        
        $AppCredz  = Get-AppCredentials (Get-VirusTotalAppCredentialID)
        if($AppCredz -eq $Null) { throw "No credential registered. Module initialized ?" ; return $Null }

        $OrgId   = $AppCredz.UserName
        $ApiKey  = $AppCredz.GetNetworkCredential().Password   

        $HeadersData = @{
            "x-apikey" = "$ApiKey"
        }
        $HeadersData
    }catch{
        Show-ExceptionDetails $_ -ShowStack
    }
}
