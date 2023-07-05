
<#
#̷𝓍   𝓐𝓡𝓢 𝓢𝓒𝓡𝓘𝓟𝓣𝓤𝓜
#̷𝓍   🇵​​​​​🇴​​​​​🇼​​​​​🇪​​​​​🇷​​​​​🇸​​​​​🇭​​​​​🇪​​​​​🇱​​​​​🇱​​​​​ 🇸​​​​​🇨​​​​​🇷​​​​​🇮​​​​​🇵​​​​​🇹​​​​​ 🇧​​​​​🇾​​​​​ 🇬​​​​​🇺​​​​​🇮​​​​​🇱​​​​​🇱​​​​​🇦​​​​​🇺​​​​​🇲​​​​​🇪​​​​​🇵​​​​​🇱​​​​​🇦​​​​​🇳​​​​​🇹​​​​​🇪​​​​​.🇶​​​​​🇨​​​​​@🇬​​​​​🇲​​​​​🇦​​​​​🇮​​​​​🇱​​​​​.🇨​​​​​🇴​​​​​🇲​​​​​
#>

# Get the VirusTotal ApiKey . Requires Secret password. Test

  [CmdletBinding(SupportsShouldProcess)]
  Param(
      [Parameter(Mandatory = $false)]
      [switch]$InitializeModule        
  )

Write-Host "[VIRUSTOTAL] " -f DarkRed -n
Write-Host "Enter decrypt key (23 _ long) : " -f DarkYellow -n
$Password = Read-Host ":"
$EncryptedApiKey = "9CO91SZLxBBmJMPpaq2X5BM/w8rP/wzZ8awfWjxRjrKDIBZEoor4/u2RuTcZAloLNvisu89/3Hw8fc0FSpdM0JpY3jrlQxxCW3Ny333z9OkVSO346dDd9rXpUlybZYkX"

$ApiKey = Decrypt-String -EncryptedString $EncryptedApiKey -Passphrase $Password

if([string]::IsNullOrEmpty($ApiKey)){
    throw "Failed : Wrong Password"
}
Write-Host "[VIRUSTOTAL] " -f DarkGreen -n
Write-Host "$ApiKey" -f Gray    

$String = "`$VirusTotalApiKey = `"$ApiKey`" "
Write-Host "$String" -f Gray    

if($InitializeModule){
    Write-Host "[VIRUSTOTAL] " -f DarkGreen -n
    Write-Host "Initialize-VirusTotalModule ..." -f Gray 
    $Username = 'arsscriptum'
    $Email = 'g.uillaumeplante.qc@gmail.com'
    Initialize-VirusTotalModule $Username $Email $ApiKey
}
