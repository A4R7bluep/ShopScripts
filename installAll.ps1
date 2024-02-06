Write-Host "These prompts must be answered in y or n format." -ForegroundColor Red
Write-Host "All prompts come before installing" -ForegroundColor Red

# Set Defaults
$steam = "n"
$spotify = "n"
$workman = "n"
$brave = "n"
$VSComunity = "n"
$VSCode = "n"
$discord = "n"
$googleDrive = "n"
$python = "n"

# Get User Input
$steam = (Read-Host -Prompt "Do you want to install Steam? (y/N)").ToLower()
$spotify = (Read-Host -Prompt "Do you want to install Spotify? (y/N)").ToLower()
$workman = (Read-Host -Prompt "Do you want to install Workman? (y/N)").ToLower()
$brave = (Read-Host -Prompt "Do you want to install Brave? (y/N)").ToLower()
$VSComunity = (Read-Host -Prompt "Do you want to install Visual Studio Community? (y/N)").ToLower()
$VSCode = (Read-Host -Prompt "Do you want to install Visual Studio Code? (y/N)").ToLower()
$discord = (Read-Host -Prompt "Do you want to install Discord? (y/N)").ToLower()
$googleDrive = (Read-Host -Prompt "Do you want to install Google Drive? (y/N)").ToLower()
$python = (Read-Host -Prompt "Do you want to install Python? (y/N)").ToLower()


if ($steam -eq "y") {
    Write-Host "Installing Steam..." -ForegroundColor Green
    winget install Valve.Steam
}

if ($spotify -eq "y") {
    Write-Host "Installing Spotify..." -ForegroundColor Green
    winget install Spotify.Spotify
}

if ($workman -eq "y") {
    Write-Host "Installing Workman..." -ForegroundColor Green
    winget install workman-layout.workman
}

if ($brave -eq "y") {
    Write-Host "Installing Brave..." -ForegroundColor Green
    winget install Brave.Brave
}

if ($VSComunity -eq "y") {
    Write-Host "Installing Visual Studio Community..." -ForegroundColor Green
    winget search Microsoft.VisualStudio.2022.Community
}

if ($VSCode -eq "y") {
    Write-Host "Installing Visual Studio Code..." -ForegroundColor Green
    winget install Microsoft.VisualStudioCode
}

if ($discord -eq "y") {
    Write-Host "Installing Discord..." -ForegroundColor Green
    winget search Discord.Discord
    # winget install Discord.Discord
}

if ($googleDrive -eq "y") {
    Write-Host "Installing Google Drive..." -ForegroundColor Green
    winget install Google.GoogleDrive
}

if ($python -eq "y") {
    Write-Host "Installing Python..." -ForegroundColor Green
    winget install Python.Python.3.12
}

$exit = Read-Host -Prompt "Script done. Press ENTER to clear terminal or enter y to close window"
if ($exit -eq "y") {
    exit
}