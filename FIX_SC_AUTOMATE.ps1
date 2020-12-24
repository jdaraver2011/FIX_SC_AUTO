$HOST.UI.RawUI.ForegroundColor = "Green"
Write-Host "--------------------------------------------------"
Write-Host "|Cleanup of Connectwise ScreenConnect/Automate***|"
Write-Host "--------------------------------------------------"
Write-Host 
$locationId = Read-Host -prompt 'Location to install? Leave blank for ProTEK New Computers'
If ($null -eq $Input) {$Input = '1'}
Write-Host
Write-Host "---------------------------------------------------"
Write-Host "|Step 1: Uninstall of Connectwise ScreenConnect***|"
Write-Host "---------------------------------------------------"
$MyApp = Get-WmiObject -Class Win32_Product | Where-Object {$_.Vendor -Match "ScreenConnect"}
$MyApp.Uninstall()
Write-Host
Write-Host "----------------------------------------------"
Write-Host "|Step 2: Uninstall of Connectwise Automate***|"
Write-Host "----------------------------------------------"
Write-Host
Invoke-Expression(New-Object Net.WebClient).DownloadString('http://bit.ly/LTPoSh') | iex; Uninstall-LTService -Server https://numsp.hostedrmm.com
Write-Host
Write-Host "--------------------------------------------"
Write-Host "|Step 3: Install of Connectwise Automate***|"
Write-Host "--------------------------------------------"
Write-Host
Invoke-Expression(New-Object Net.WebClient).DownloadString('http://bit.ly/LTPoSh') | iex; Install-LTService -Server https://proteksolutions.hostedrmm.com -Password MiIbitsBh26O65C58rTLR3ehQ4vPzX37 -LocationID $locationID
pause
