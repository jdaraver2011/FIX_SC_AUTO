Function Install-Automate{
<#
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}
$HOST.UI.RawUI.ForegroundColor = "Green"
Write-Host "-----------------------------------------------------------------"
Write-Host "|***Uninstall/Reinstall of Connectwise ScreenConnect/Automate***|"
Write-Host "-----------------------------------------------------------------"
Write-Host 
$locationId = Read-Host -prompt 'What location would you like to install? If not known type leave blank for ProTEK New Computers'
Write-Host
Write-Host "---------------------------------------------------"
Write-Host "|Step 1: Uninstall of Connectwise ScreenConnect***|"
Write-Host "---------------------------------------------------"
$MyApp = Get-WmiObject -Class Win32_Product | Where-Object {$_.Vendor -Match "ScreenConnect"}
$MyApp.Uninstall()
If ($null -eq $Input) {$Input = '1'}
Write-Host
Write-Host "----------------------------------------------"
Write-Host "|Step 2: Uninstall of Connectwise Automate***|"
Write-Host "----------------------------------------------"
Write-Host
Invoke-Expression(New-Object Net.WebClient).DownloadString('http://bit.ly/LTPoSh') | iex; Uninstall-LTService -Server https://numsp.hostedrmm.com
Write-Host
Write-Host "------------------------------------------------------------------------"
Write-Host "|Step 3: Install of Connectwise Automate to location specified above***|"
Write-Host "------------------------------------------------------------------------"
Write-Host
Invoke-Expression(New-Object Net.WebClient).DownloadString('http://bit.ly/LTPoSh') | iex; Install-LTService -Server https://proteksolutions.hostedrmm.com -Password MiIbitsBh26O65C58rTLR3ehQ4vPzX37 -LocationID $locationID
pause
}
