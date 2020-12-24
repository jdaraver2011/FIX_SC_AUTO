$HOST.UI.RawUI.ForegroundColor = "Green"
Write-Host "| Client ID List for Install  |"
Write-Host "|ProT 1   MBA   16    WVG   31|"
Write-Host "|HM   2   MD    17    DUC   32|"
Write-Host "|A&G  3   NHS   18    SRMSDC33|"
Write-Host "|B&G  4   NOBA  19    RM    34|"
Write-Host "|B&T  5   NSP   20    WSBR  35|"
Write-Host "|CUEE 6   OIPM  21    MSE   36|"
Write-Host "|CCNO 7   OPSO  22    NSHS  37|"
Write-Host "|DDD  8   RLC   23    CCI   38|"
Write-Host "|FANO	9   RDI   24    TWFG  39|"
Write-Host "|FOLA	10  SC    25    RMS   40|"
Write-Host "|FABC 11  SBCPA 26            |"
Write-Host "|GSLE 12  SHA   27            |"
Write-Host "|HOF  13  TOM   28            |"
Write-Host "|IAP  14  UH    29            |"
Write-Host "|JAGNO15  VPG   30            |"
Write-Host
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
