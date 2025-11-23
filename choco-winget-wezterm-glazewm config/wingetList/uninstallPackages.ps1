$exportData = Get-Content -Path "wingetListDelete.json" -Raw | ConvertFrom-Json

 foreach ($package in $exportData.Sources.Packages){
 $packageId = $package.PackageIdentifier
 Write-Host "Uninstalling: $packageId"

 try {
    winget uninstall --id $packageId --silent
    Write-Host "Success $packageId" -ForegroundColor Green
 }
 catch{
    Write-Host "Failed $packageId" -ForegroundColor Red
 }

}
