# Chocolatey installeren
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Git installeren
choco install git -y

# Pad handmatig toevoegen (mocht installatie niet goed gegaan zijn)
$env:Path += ";C:\Program Files\Git\cmd;C:\Program Files\Git\bin"

# Versie opvragen. Ook meteen een check of git op de juiste manier is geinstalleerd.
git --version

# Verander de huidige directory naar de doeldirectory
Set-Location -Path C:\Website\

# Clone je GitHub-repository naar de doeldirectory
git clone https://github.com/Kroketje292/uitprobeersel