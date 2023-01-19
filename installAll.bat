@echo off

rmdir %USERPROFILE%\InstallerScript /s

mkdir %USERPROFILE%\InstallerScript\

set "steam=y"
set /p "steam=Do you want to install Steam? [Y:n]: "
if /i "%steam%" == "y" goto :steam

set "spotify=y"
set /p "spotify=Do you want to install Spotify? [Y:n]: "
if /i "%spotify%" == "y" goto :spotify

set "workman=y"
set /p "workman=Do you want to install Workman? [Y:n]: "
if /i "%workman%" == "y" goto :workman

set "brave=y"
set /p "brave=Do you want to install Brave? [Y:n]: "
if /i "%brave%" == "y" goto :brave

set "VSComunity=y"
set /p "VSComunity=Do you want to install Visual Studio Community? [Y:n]: "
if /i "%VSComunity%" == "y" goto :VSComunity

set "VSCode=y"
set /p "VSCode=Do you want to install Visual Studio Code? [Y:n]: "
if /i "%VSCode%" == "y" goto :VSCode

set "discord=y"
set /p "discord=Do you want to install Discord? [Y:n]: "
if /i "%discord%" == "y" goto :discord

set "googleDrive=y"
set /p "googleDrive=Do you want to install Google Drive? [Y:n]: "
if /i "%googleDrive%" == "y" goto :googleDrive

set "python=y"
set /p "python=Do you want to install Python? [Y:n]: "
if /i "%python%" == "y" goto :python

:steam
curl -o C:\Users\rossgibson\InstallerScript\steamInstall.exe "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"
C:\Users\rossgibson\InstallerScript\steamInstall.exe

:spotify
curl -o C:\Users\rossgibson\InstallerScript\spotifyInstall.exe "https://download.scdn.co/SpotifySetup.exe"
C:\Users\rossgibson\InstallerScript\spotifyInstall.exe

:workman
curl -o C:\Users\rossgibson\InstallerScript\workmanInstall.msi "https://github.com/workman-layout/Workman/blob/master/windows/installer/workman-us/wm-us_amd64.msi"
C:\Users\rossgibson\InstallerScript\workmanInstall.msi

:brave
curl -o C:\Users\rossgibson\InstallerScript\braveInstall.exe "https://referrals.brave.com/latest/BraveBrowserSetup.exe"
C:\Users\rossgibson\InstallerScript\braveInstall.exe

:VSComunity
curl -o C:\Users\rossgibson\InstallerScript\VSCommunityInstall.exe "https://aka.ms/vs/17/release/vs_community.exe"
C:\Users\rossgibson\InstallerScript\VSCommunityInstall.exe

:VSCode
curl -o C:\Users\rossgibson\InstallerScript\VSCodeInstall.exe "https://az764295.vo.msecnd.net/stable/c722ca6c7eed3d7987c0d5c3df5c45f6b15e77d1/VSCodeUserSetup-x64-1.65.2.exe"
C:\Users\rossgibson\InstallerScript\VSCodeInstall.exe

:discord
curl -o C:\Users\rossgibson\InstallerScript\discordInstall.exe "https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9004/DiscordSetup.exe"
C:\Users\rossgibson\InstallerScript\discordInstall.exe

:googleDrive
curl -o C:\Users\rossgibson\InstallerScript\googleDriveInstall.exe "https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe"
C:\Users\rossgibson\InstallerScript\googleDriveInstall.exe

:python
curl -o C:\Users\rossgibson\InstallerScript\pythonInstall.exe "https://www.python.org/ftp/python/3.10.3/python-3.10.3-amd64.exe"
C:\Users\rossgibson\InstallerScript\pythonInstall.exe