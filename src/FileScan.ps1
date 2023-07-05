<#
#̷𝓍   𝓐𝓡𝓢 𝓢𝓒𝓡𝓘𝓟𝓣𝓤𝓜
#̷𝓍   🇵​​​​​🇴​​​​​🇼​​​​​🇪​​​​​🇷​​​​​🇸​​​​​🇭​​​​​🇪​​​​​🇱​​​​​🇱​​​​​ 🇸​​​​​🇨​​​​​🇷​​​​​🇮​​​​​🇵​​​​​🇹​​​​​ 🇧​​​​​🇾​​​​​ 🇬​​​​​🇺​​​​​🇮​​​​​🇱​​​​​🇱​​​​​🇦​​​​​🇺​​​​​🇲​​​​​🇪​​​​​🇵​​​​​🇱​​​​​🇦​​​​​🇳​​​​​🇹​​​​​🇪​​​​​.🇶​​​​​🇨​​​​​@🇬​​​​​🇲​​​​​🇦​​​​​🇮​​​​​🇱​​​​​.🇨​​​​​🇴​​​​​🇲​​​​​
#>


<#
    .SYNOPSIS
        Request a VirusTotalFileScan
    .DESCRIPTION
       If the file to be uploaded is bigger than 32MB, please use the /files/upload_url endpoint instead which admits files up to 650MB.

#> 
Function Request-VirusTotalFileScan {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0, Mandatory=$true,  HelpMessage="Prompt")]
        [string]$Path
    )

     try{
        $ErrorOccured = $False

  
        [String]$endpointUri = "https://www.virustotal.com/api/v3/files"
      
                
        $headers = Get-OpenAIAuthenticationHeader
        $headers.Add("accept", "application/json")
        $headers.Add("content-type", "multipart/form-data")

        $body = "{
            ""size"": ""$Size"",
            ""prompt"": ""$Prompt""
        }"

        Write-Verbose "Invoke-WebRequest Url: $Url P = $P"
        
        $WebRequestResult = Invoke-WebRequest -uri $endpointUri -Headers $headers -Body $body -Method POST -ErrorVariable $LastError
        $ResponseJson = $WebRequestResult.Content
     
        $ResponseList = $ResponseJson | ConvertFrom-Json 
        
        $ResponseList
        
    }catch{
        $ErrorOccured = $True
        Show-ExceptionDetails $_
    }

    if($ErrorOccured -eq $True){
        return $Null
    }
}

