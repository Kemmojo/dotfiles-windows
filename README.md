# dotfiles-windows
Windoof, if something breaks and you need to reinstall, take my Setting, i will try to keep it as simple as eating cheese cake.

# Before a fresh installtion 
1. Check your personal files
2. Store Passwords
3. Check Browser settings and bookmarkes
4. Backup your Game-setups & -settings & -profiles
 

# After a fresh installtion
1. Update your System to the highest
2. ( If **Nvidia** ) Download **[Nvidia Geforce Experience](https://www.geforce.com/geforce-experience/download)**
    - Install newest drivers
3. Go to ‘Settings’ -> ‘Update and Security’ -> ‘For developers’: Enable ‘Developer mode’
4. Execute the **Windows Download & Execute bootstrap command** below
5. Execute `bootstrap-windows.ps1` in `powershell.exe` as Admin
6. Install **Ubuntu** from the **Microsoft App**
7. Start **ConEmu**
    1. Make sure the **Command** textbox contains something simular to this:
        - ```set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl -cur_console:pm:/mnt```
    2. The Ubuntu bash shell should be started
        - If not, follow the following guide: https://conemu.github.io/en/BashOnWindows.html
    3. Change to **HOME** directory `cd $HOME`
8. Install unzip `sudo apt install unzip`
9. Execute `wget https://github.com/Kemmojo/dotfiles-windows/archive/master.zip && unzip master.zip && mv dotfiles-windows-master dotfiles && rm master.zip && cd dotfiles && sh bootstrap-wsl.sh`
10. If you are beeing asked, to change the **default shell**, confirm with `y[Yes]` and `Enter`
11. After **oh-my-zsh** installation, execute `sh $HOME/dotfiles/bootstrap-wsl.sh`
12. Run `nvim`, if the setup seems stuck, type `:q` to exit, and again to exit out of **neovim**
13. Restart **ConEmu** and check which shell you are using by default via `ps -p $$`, if it says `zsh` everything is fine
14. asd


**Windows Download & Execute bootstrap command**
```powershell
Set-ExecutionPolicy Bypass; `
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
    - Filezilla
    - Rufus
- **Multimedia**
    - Youtube-dl
    - Vlc
    - Spotify
- **Security**
    - Malwarebytes
- **Gaming & Communication**
    - Steam
    - OBS-Studio
    - Streamlabs OBS
    - Teamspeak
    - Discord
    - Whatsapp Desktop
    - Epic Games Launcher
    - Origin Launcher
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
    - ConEmu


## Design Tools
Unfortunatly Programs like **Photoshop**, or **Afinity Photo** are excluded
from this setup, because their unavailable for free download.

## WSL-Setup
# TODO: Hier alles verlinken!
# TODO: Install LAMP + Composer + Laravel
- ZSH
- oh-my-zsh
- Neovim + KemmojoVim (My personal setup)
- LAMPP ( Linux / Apache / MySQL / PHP / Perl )
    - X-Debug
    - Composer
    - Laravel
- Node/NPM
    - Sass
    - Typescript
    - webpack
    - webpack-cli


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

# TODO: Write down Information about how the Webserver works and what you can do
