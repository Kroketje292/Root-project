
# Controleer of het script wordt uitgevoerd als administrator
$adminRights = [System.Security.Principal.WindowsPrincipal][System.Security.Principal.WindowsIdentity]::GetCurrent()
$adminCheck = $adminRights.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)

# Als het script niet wordt uitgevoerd als administrator, start dan opnieuw als administrator
if (-not $adminCheck) {
    Write-Host "Dit script moet als administrator worden uitgevoerd."
    Start-Process powershell.exe -Verb RunAs -ArgumentList ($MyInvocation.MyCommand.Definition)
    Exit
}

#Installeren van Windows IIS
Install-WindowsFeature -name Web-Server -IncludeManagementTools

# Chocolatey installeren
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Git installeren
choco install git -y

# Pad handmatig toevoegen (mocht installatie niet goed gegaan zijn)
$env:Path += ";C:\Program Files\Git\cmd;C:\Program Files\Git\bin"

# Versie opvragen. Ook meteen een check of git op de juiste manier is geinstalleerd.
git --version

# Directory aanmaken voor webserver contents
New-Item -ItemType Directory -Path "C:\Website\"

# Verander de huidige directory naar de doeldirectory
Set-Location -Path C:\Website\

# Clone je GitHub-repository naar de doeldirectory
git clone https://github.com/Kroketje292/uitprobeersel.git

# Nieuwe website aanmaken met de nieuwe contents
New-Website -Name "Root-webserver" -Port 80 -PhysicalPath "C:\Website\uitprobeersel"

# Rechten geven op de site contents
$webServerIdentity = "administrator"  # Dit is de standaardidentiteit voor de IIS-webserver
$folderPath = "C:\Website"
$accessRights = "Read, write"  # Je kunt hier de gewenste toegangsrechten aanpassen

# Machtigingen toekennen
$acl = Get-Acl $folderPath
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule($webServerIdentity, $accessRights, "Allow")
$acl.AddAccessRule($rule)
Set-Acl -Path $folderPath -AclObject $acl

# Optioneel: Controleren of de machtigingen zijn toegevoegd
Get-Acl $folderPath

# Default website disabelen
Stop-Website "Default web site"

# Nieuw aanagemaakte website enabele
Start-Website "Root-webserver"

# IP-adres ophalen van machine
$ipAddress = (Get-NetIPAddress | Where-Object { $_.AddressFamily -eq 'IPv4' -and $_.IPAddress -notlike '127.*'}).IPAddress #ipAddress variabele maken

# Link naar de webserver in de browser
Write-Host "Je kunt nu je website bekijken in de browser via: http://localhost/ of via http://$ipAddress/"

# Wacht op Enter om het venster te sluiten
Write-Host "Druk op Enter om het venster te sluiten..."
$null = Read-Host