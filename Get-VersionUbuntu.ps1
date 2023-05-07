# Init Current Date Time
$datetime = Get-Date -UFormat "%Y-%m-%dT%H:%M:%S.%3NZ"


# Invoke-RestMethod to get data from Ubuntu.com
function Get-VerUbuntuLTS{
    $responseLTS = Invoke-RestMethod -Uri "https://ubuntu.com/download/desktop"
    $ubuntuVerLTS = $responseLTS | Find " LTS</h2>"
    $ubuntuVerLTS = $ubuntuVerLTS.Replace("<h2>", "").Replace("</h2>","")
    $ubuntuVerLTS = $ubuntuVerLTS.Trim()
    Write-Host -ForegroundColor Green $datetime "- Latest version: " $ubuntuVerLTS
}

function Get-VerUbuntu{
    $response = Invoke-RestMethod -Uri "https://ubuntu.com/download/desktop"
    $ubuntuVer = $response | Find "<h2>Ubuntu "
    $ubuntuVer = ($ubuntuVer -split "`r?`n").TrimEnd()[-2] -join "`r`n"
    $ubuntuVer = $ubuntuVer.Replace("<h2>", "").Replace("</h2>","")
    $ubuntuVer = $ubuntuVer.Trim()
    Write-Host -ForegroundColor Green $datetime "- Latest version: " $ubuntuVer
}

# Call the functions
Get-VerUbuntuLTS
Get-VerUbuntu

