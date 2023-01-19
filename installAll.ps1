Remove-Item -Path $env:USERPROFILE\InstallerScript -Recurse -ErrorAction SilentlyContinue
New-Item -Path $env:USERPROFILE\InstallerScript -ItemType Directory -ErrorAction SilentlyContinue
cd $env:USERPROFILE\InstallerScript

Write-Host "These prompts must be answered in y or n format." -ForegroundColor Red

$steam = Read-Host -Prompt "Do you want to install Steam? (y/n)"
$spotify = Read-Host -Prompt "Do you want to install Spotify? (y/n)" -Default "n" -NoNewline
#$workman = Read-Host -Prompt "Do you want to install Workman? (y/n)" -Default "n" -NoNewline
$brave = Read-Host -Prompt "Do you want to install Brave? (y/n)" -Default "n" -NoNewline
$VSComunity = Read-Host -Prompt "Do you want to install Visual Studio Community? (y/n)" -Default "n" -NoNewline
$VSCode = Read-Host -Prompt "Do you want to install Visual Studio Code? (y/n)" -Default "n" -NoNewline
$discord = Read-Host -Prompt "Do you want to install Discord? (y/n)" -Default "n" -NoNewline
$googleDrive = Read-Host -Prompt "Do you want to install Google Drive? (y/n)" -Default "n" -NoNewline
$python = Read-Host -Prompt "Do you want to install Python? (y/n)" -Default "n" -NoNewline

if ($steam -eq "y") {
    Write-Host "Installing Steam..." -ForegroundColor Green
    curl -o $env:USERPROFILE\InstallerScript\steamInstall.exe "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"
    .\steamInstall.exe
}

if ($spotify -eq "y") {
    Write-Host "Installing Spotify..." -ForegroundColor Green
    curl -o $env:USERPROFILE\InstallerScript\spotifyInstall.exe "https://download.scdn.co/SpotifySetup.exe"
    .\spotifyInstall.exe
}

#if ($workman -eq "y") {
#    Write-Host "Installing Workman..." -ForegroundColor Green
#    curl -o $env:USERPROFILE\InstallerScript\workmanInstall.msi "https://github.com/workman-layout/Workman/blob/master/windows/installer/workman-us/wm-us_amd64.msi"
#    .\workmanInstall.msi
#}

if ($brave -eq "y") {
    Write-Host "Installing Brave..." -ForegroundColor Green
    curl -o $env:USERPROFILE\InstallerScript\braveInstall.exe "https://referrals.brave.com/latest/BraveBrowserSetup.exe"
    .\braveInstall.exe
}

if ($VSComunity -eq "y") {
    Write-Host "Installing Visual Studio Community..." -ForegroundColor Green
    curl -o $env:USERPROFILE\InstallerScript\VSComunityInstall.exe "https://aka.ms/vs/17/release/vs_community.exe"
    .\VSComunityInstall.exe
}

if ($VSCode -eq "y") {
    Write-Host "Installing Visual Studio Code..." -ForegroundColor Green
    curl -o $env:USERPROFILE\InstallerScript\VSCodeInstall.exe "https://az764295.vo.msecnd.net/stable/c722ca6c7eed3d7987c0d5c3df5c45f6b15e77d1/VSCodeUserSetup-x64-1.65.2.exe"
    .\VSCodeInstall.exe
}

if ($discord -eq "y") {
    Write-Host "Installing Discord..." -ForegroundColor Green
    curl -o $env:USERPROFILE\InstallerScript\discordInstall.exe "https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9004/DiscordSetup.exe"
    .\discordInstall.exe
}

if ($googleDrive -eq "y") {
    Write-Host "Installing Google Drive..." -ForegroundColor Green
    curl -o $env:USERPROFILE\InstallerScript\driveInstall.exe "https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe"
    .\driveInstall.exe
}

if ($python -eq "y") {
    Write-Host "Installing Python..." -ForegroundColor Green
    curl -o $env:USERPROFILE\InstallerScript\pythonInstall.exe "https://www.python.org/ftp/python/3.10.3/python-3.10.3-amd64.exe"
    .\pythonInstall.exe
}
