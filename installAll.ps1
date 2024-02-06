function Prompt {
    param (
        [Parameter(Mandatory)]
        $appName,
        $appID
    )

    $input = Read-Host 'Do you want to install' $appName

    $output = $input -match '^y(es)?$'

    if ($output) {
        if ($appName -eq "Spicetify") {
            iwr -useb "https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1" | iex
            iwr -useb "https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1" | iex
        }
        else {
            winget install $appID
        }
    }
}

Prompt -appName "Brave" -appID "Brave.Brave"
Prompt -appName "Discord" -appID "Discord.Discord"
Prompt -appName "Spotify" -appID "Spotify.Spotify"
Prompt -appName "VS Code" -appID "Microsoft.VisualStudioCode"
Prompt -appName "Steam" -appID "Valve.Steam"
Prompt -appName "VS Community" -appID "Microsoft.VisualStudio.2022.Community"
Prompt -appName "Workman Layout" -appID "workman-layout.workman"
Prompt -appName "Python 3.11" -appID "9NRWMJP3717K"
Prompt -appName "Google Drive" -appID "Google.Drive"
Prompt -appName "PowerToys" -appID "Microsoft.PowerToys"
Prompt -appName "TranslucentTB" -appID "9PF4KZ2VN4W9"
Prompt -appName "Spicetify"
