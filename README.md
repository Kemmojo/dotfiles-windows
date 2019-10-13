# dotfiles-windows
Windoof, if something breaks and you need to reinstall, take my Setting, i will try to keep it as simple as eating cheese cake.

# Before a fresh installtion 
1. Check your personal files
2. Store Passwords
3. Check Browser settings nad bookmarker
4. Backup your Game-setups & -settings & -profiles
5. 
 

# After a fresh installtion
1. Update your System to the highest
2. ( If Nvidia ) Download **[Nvidia Geforce Experience](https://www.geforce.com/geforce-experience/download)**
    - Install newest drivers
3. Execute the download command below
4. Execute `bootstrap-windows.ps1` in `powershell.exe` as Admin
5. Execute `sh bootstrap-wsl.sh ` in `alacritty.exe`

**Test Download command:**
```powershell
Set-ExecutionPolicy RemoteSigned; `
Invoke-WebRequest "http://github.com/Kemmojo/dotfiles-windows/archive/master.zip" `
-OutFile "$HOME\Downloads\dotfiles-windows.zip"; `
Get-ChildItem "$HOME\Downloads\" -Filter *.zip | Expand-Archive -DestinationPath "$HOME" -Force; `
Rename-Item -NewName "dotfiles" -Path "$HOME\dotfiles-windows-master"; `
. "$HOME\dotfiles\remotetestscript.ps1"
```

**Real Download command:**
```powershell
Set-ExecutionPolicy RemoteSigned; `
Invoke-WebRequest "http://github.com/Kemmojo/dotfiles-windows/archive/master.zip" `
-OutFile "$HOME\Downloads\dotfiles-windows.zip"; `
Get-ChildItem "$HOME\Downloads\" -Filter *.zip | Expand-Archive -DestinationPath "$HOME" -Force; `
Rename-Item -NewName "dotfiles" -Path "$HOME\dotfiles-windows-master"; `
. "$HOME\dotfiles\bootstrap-windows.ps1"
```

# So what is getting installed?
## Windows-Setup
- **Fonts**
    - firacode
    - sourcecodepro
- **Browser**
    - Firefox
    - Google Chrome
    - Opera
- **Essentials**
    - Keepass
    - 7zip
    - 7zip.commandline
    - Winrar
    - Totalcommander
    - Filezilla
    - Rufus
- **Multimedia**
    - Youtube-dl
    - Vlc
    - Spotify
- **Security**
    - Malwarebytes
- **Gaming & Communication**
    - Battle.net
    - Steam
    - OBS-Studio
    - Teamspeak
    - Twitch-App
    - Discord
    - Whatsapp Desktop
    - Epic Games Launcher
- **Note taking**
    - Joplin
- **Mail-Client**
    - Thunderbird
- **Clouds**
    - Dropbox
    - Google Drive
- **Office**
    - libreoffice-fresh
- **Torrenting**
    - utorrent
    - jdownloader
- **Music development**
    - Audacity
- **PDF Reader**
    - Adobe Acrobatreader
- **Virtual Machines**
    - Virtualbox
- **Academic Paper creation**
    - Texmaker
- **Gamedevelopment**
    - Unity
    - Blender
- **Developent**
    - git
    - git-credential-manager-for-windows
    - Javaruntime
    - Java Jdk
    - Android Studio
    - Postman
- **Sysadmin**
    - Teamviewer
    - nmap
    - Wireshark
- **Editor & IDEs**
    - Neovim
    - Visual-Studio-Code
    - Visual-Studio-Code-insiders
    - Sublimetext3
- **WSL ( Windows Subsystem for Linux )**
    - WSL-Ubuntu-1804
    - Alacritty


## Design Tools
Unfortunatly Programs like **Photoshop**, or **Afinity Photo** are excluded
from this setup, because their unavailable for free download.

## WSL-Setup
- LAMPP ( Linux / Apache / MySQL / PHP / Perl )
    - X-Debug
- Node/NPM
    - Sass
    - Typescript
    - asd



# Partitioning & Locations ( Recommandation )
**Short Disclaimer:** I love organisation and hate to search my butt flat,
So this Setup recommands a subjective architecture, which might not hit your needs.

- **C:** (Place for: )
    - Windows per se
    - WSL + Development Environment
- **D:** ( Thirdparty Software/Apps/Programs )
- **E:** ( Gaming )


# Inspiration from ( Credit )
- https://github.com/Nidzo-Vidic/windows-dotfiles/blob/master/Bootstrap.ps1






 


