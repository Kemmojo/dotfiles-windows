# dotfiles-windows
Windoof, if something breaks and you need to reinstall, take my Setting, i will try to keep it as simple as eating cheese cake.

# What you need
- 3GB of diskspace

# For whom does this setup fit
Consider programs included in this setup try to satify the needs of:
- Gamer
    - Steam
    - Epic Games
    - Maybe Streamer
- Developer
    - Webdeveloper(especially PHP-Developer)
    - CLI-Developer
    - Android Developer
    - Gamedeveloper
- Someone Writing needs on an academic level
    - Texmaker
    - Joplin
    - Libre Office


# So what is getting installed? ( TODO: Link Stuff )
## Windows-Setup0
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


## Design Tools
Unfortunatly Programs like **Photoshop**, or **Afinity Photo** are excluded
from this setup, because their unavailable for free download.

## WSL-Setup
- **ConEmu**
- **ZSH**
    - oh-my-zsh
        - zsh-completions
        - zsh-syntax-highlighting
        - zsh-dircolors-solarized
        - zsh-256color
        - solarized-man
        - zsh-autosuggestions
    - bat
    - fzf
- **Neovim + KemmojoVim (My personal setup)**
- **LAMP ( Linux / Apache / MySQL / PHP )**
    - php@7.2
    - fancy-index
    - X-Debug
    - Composer
    - Laravel
- **Node/NPM**
    - Sass
    - Typescript
    - webpack
    - webpack-cli
    - Vue-cli


# Partitioning & Locations ( Recommandation )
**Short Disclaimer:** I love organisation and hate to search my butt flat,
So this Setup recommands a subjective architecture, which might not hit your needs.

- **C:** (Place for: )
    - Windows per se
    - **Development Environment:** User/Code
    - **WebServer Root** User/Code/Webdev/www
- **D:** ( Thirdparty Software/Apps/Programs )
- **E:** ( Gaming )


# Information: Webserver
Apache2- and MySQL-Services are initiated on ConEmu startup.

## Interaction
In the `oh-my-env.sh` in your Ubuntu `$HOME` directory you find functions which **start**, **restart** and **stop** the installed **apache2** and **mysql** server.
- `webserver-start`
- `webserver-restart`
- `webserver-stop`

## Fancy-Index
You ma recognize that the usual Directory-Indexing desing looks different, this was achiev through a little porject called **fancy-index**, which adds icons and a stylesheet to the index.



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
7. Make sure that your clock is in sync with th global clock, otherwise ubuntu updates will fail
    - You can do this in your bios
8. Start **ConEmu**
    1. Make sure the **Command** textbox contains something simular to this:
        - ```set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl -cur_console:pm:/mnt```
    2. The Ubuntu bash shell should be started
        - If not, follow the following guide: https://conemu.github.io/en/BashOnWindows.html
    3. Change to **HOME** directory `cd $HOME`
9. Install unzip `sudo apt install unzip`
10. Execute `wget https://github.com/Kemmojo/dotfiles-windows/archive/master.zip && unzip master.zip && mv dotfiles-windows-master dotfiles && rm master.zip && cd dotfiles && sh bootstrap-wsl.sh`
11. If you are beeing asked, to change the **default shell**, confirm with `y[Yes]` and `Enter`
12. After **oh-my-zsh** installation, execute `sh $HOME/dotfiles/bootstrap-wsl.sh`
13. Run `nvim`, if the setup seems stuck, type `:q` to exit, and again to exit out of **neovim**
14. Restart **ConEmu** and check which shell you are using by default via `ps -p $$`, if it says `zsh` everything is fine
15. Follow the **Finishing moves** section


**Windows Download & Execute bootstrap command**
```powershell
Set-ExecutionPolicy Bypass; `
Invoke-WebRequest "http://github.com/Kemmojo/dotfiles-windows/archive/master.zip" `
-OutFile "$HOME\Downloads\dotfiles-windows.zip"; `
Get-ChildItem "$HOME\Downloads\" -Filter *.zip | Expand-Archive -DestinationPath "$HOME" -Force; `
Rename-Item -NewName "dotfiles" -Path "$HOME\dotfiles-windows-master"; `
. "$HOME\dotfiles\bootstrap-windows.ps1"
```

## Finishing moves
In order to setup non automativ processes and check out if everyting works as expected, checkout the following list.
If none show you any errors your setup if perfecly installed.
If your´re getting error, try to figure out what they say, by googling them, but most of them should show you a direct solutions imidiatly.

1. Of cource try reaching for **all installed Applications**, sometimes apps dont get installed, for instance, because of missing mirrors
2. For **dircolors** execute `setupsolarized`, make that `l` command beautiful
3. Execute `bat` in ConEmu
4. Execute `fzf` in ConEmu
5. Execute `nvim` or `vi`, even `v` should work, to open Neovim in ConEmu
6. Execute `php -v` in ConEmu
7. Execute `mysql -v` in ConEmu
8. Execute `laravel` in ConEmu
9. Execute `node -v` in ConEmu
10. Execute `npm -v` in ConEmu
11. Execute `vue` in ConEmu
12. Execute `webserver-start` in ConEmu in order to start apache2 and mysql, if they aren´t running already



# Inspiration from ( Credit )
- https://github.com/Nidzo-Vidic/windows-dotfiles/blob/master/Bootstrap.ps1
