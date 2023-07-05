<#
#̷𝓍   𝓐𝓡𝓢 𝓢𝓒𝓡𝓘𝓟𝓣𝓤𝓜
#̷𝓍   🇵​​​​​🇴​​​​​🇼​​​​​🇪​​​​​🇷​​​​​🇸​​​​​🇭​​​​​🇪​​​​​🇱​​​​​🇱​​​​​ 🇸​​​​​🇨​​​​​🇷​​​​​🇮​​​​​🇵​​​​​🇹​​​​​ 🇧​​​​​🇾​​​​​ 🇬​​​​​🇺​​​​​🇮​​​​​🇱​​​​​🇱​​​​​🇦​​​​​🇺​​​​​🇲​​​​​🇪​​​​​🇵​​​​​🇱​​​​​🇦​​​​​🇳​​​​​🇹​​​​​🇪​​​​​.🇶​​​​​🇨​​​​​@🇬​​​​​🇲​​​​​🇦​​​​​🇮​​​​​🇱​​​​​.🇨​​​​​🇴​​​​​🇲​​​​​
#>



function Get-VirusTotalModuleInformation{
    [CmdletBinding()]
    param()
        $ModuleName = $ExecutionContext.SessionState.Module
        $ModuleScriptPath = $ScriptMyInvocation = $Script:MyInvocation.MyCommand.Path
        $ModuleScriptPath = (Get-Item "$ModuleScriptPath").DirectoryName
        $CurrentScriptName = $Script:MyInvocation.MyCommand.Name
        $ModuleInformation = @{
            Module        = $ModuleName
            ModuleScriptPath  = $ModuleScriptPath
            CurrentScriptName = $CurrentScriptName
        }
        return $ModuleInformation
}

function Get-VirusTotalModuleLogsSavePath{
    [CmdletBinding(SupportsShouldProcess)]
    param()  
    $ModuleScriptPath = (Get-VirusTotalModuleInformation).ModuleScriptPath
    $Path = Join-Path $ModuleScriptPath "Logs"
    if(-not(Test-Path $Path)){
        new-item -Path $Path -Force -ItemType Directory -ErrorAction Ignore | Out-Null
    }
    $Path
}

<#
    .SYNOPSIS
        Simple function to log data
    .DESCRIPTION
       Logs a OpenAI data request and response to a file
#> 
Function Invoke-VirusTotalLogRequest {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0, Mandatory=$true,  HelpMessage="Request")]
        [OpenAiTextRequest]$Request,
        [Parameter(Position = 1, Mandatory=$true, HelpMessage="Response")]
        [OpenAiTextResponse]$Response
    )

     try{
        $ErrorOccured = $False


        $now = [DateTime]::Now
        [string]$FileName = ConvertTo-CTime -InputEpoch $now 
        $FileName += '.log'
        $LogPath = Get-VirusTotalModuleLogsSavePath

        $LogFileName = Join-Path $LogPath $FileName

        $RequestString = $Request | ConvertTo-Json 
        $RequestString | Set-Content $LogFileName -Force

        $ResponseString = $Response | ConvertTo-Json 
        $ResponseString | Add-Content $LogFileName -Force

        Write-Verbose "Log saved to : $LogFileName"
        Write-Verbose "==========================="
        Write-Verbose "$RequestString"
        Write-Verbose "==========================="
        Write-Verbose "$ResponseString"
        return $Null
    }catch{
        $ErrorOccured = $True
        Show-ExceptionDetails $_
    }

    if($ErrorOccured -eq $True){
        return $Null
    }
}
