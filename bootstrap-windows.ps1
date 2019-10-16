## Welcome
echo "Welcome to Kemojos Windows-Bootstrap Script"
echo ""

######################
## PowerShell setup ##
######################

# Set execution policy to remote signed
# Set-ExecutionPolicy RemoteSigned

# Set network category to private
# Set-NetConnectionProfile -NetworkCategory Private


############################
## Install choco.exelatey ##
############################

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


########################
## Install software   ##
########################
# Fonts
choco.exe install firacode -y
choco.exe install sourcecodepro -y

# Developent
choco.exe install git -y
choco.exe install git-credential-manager-for-windows -y
choco.exe install javaruntime -y
choco.exe install java.jdk -y
choco.exe install androidstudio -y
choco.exe install postman -y

# WSL ( Windows Subsystem for Linux )
choco.exe install wsl-ubuntu-1804 -y

# Browser
choco.exe install firefox -y
choco.exe install googlechrome -y
choco.exe install opera -y

# Essentials
choco.exe install conemu -y
choco.exe install keepass -y
choco.exe install 7zip -y
choco.exe install 7zip.commandline -y
choco.exe install winrar -y
choco.exe install totalcommander -y
choco.exe install filezilla -y
choco.exe install rufus -y

# Sysadmin
choco.exe install teamviewer -y
choco.exe install nmap -y
choco.exe install wireshark -y

# Editor & IDEs
choco.exe install neovim -y
choco.exe install vscode -y
choco.exe install visualstudiocode-insiders -y
choco.exe install sublimetext3

# Multimedia
choco.exe install youtube-dl -y
choco.exe install vlc -y
choco.exe install spotify -y

## Security
choco.exe install malwarebytes -y

# Gaming & Communication
choco.exe install battle.net -y
choco.exe install steam -y
choco.exe install obs-studio -y
choco.exe install teamspeak -y
choco.exe install twitch -y
choco.exe install discord -y
choco.exe install whatsapp -y
choco.exe install epicgameslauncher -y

# Note taking
choco.exe install joplin -y

# Gamedevelopment
choco.exe install unity -y
choco.exe install blender -y

# Mail-Client
choco.exe install thunderbird -y

# Clouds
choco.exe install dropbox -y
choco.exe install google-backup-and-sync -y

# Office
choco.exe install libreoffice-fresh -y

# Torrenting
choco.exe install utorrent -y
choco.exe install jdownloader -y

# Music development
choco.exe install audacity -y

# PDF Reader
choco.exe install adobereader -y

# Virtual Machines
choco.exe install virtualbox -y

# Academic Paper creation
choco.exe install texmaker -y


################################
## Induvidual Installtions    ##
################################

# Flowkey
# XING
# FL Studio
# iCUE
# Alesis V61 Editor
# Adobe Photoshop
# Adobe XD
# ISO Handling -> deamon tools lite
# Adobe Cloude + Adobe XD


################################
## Windows Settings           ##
################################
# Accellerate curosr speed


################################
## Install VS Code Extensions ##
################################
$installation_block = {
    $extensions =
        'eamodio.gitlens',
        'ms-vscode.csharp',
        'ms-vscode.powershell',
        'ms-vsliveshare.vsliveshare',
        'PKief.material-icon-theme',
        'ritwickdey.LiveServer',
        'shd101wyy.markdown-preview-enhanced',
        'sidneys1.gitconfig',
        'Tyriar.sort-lines',
        'VisualStudioExptTeam.vscodeintellicode',
        'yycalm.linecount',
        'zhuangtongfa.Material-theme'

    for ($i = 0; $i -lt $extensions.Count; $i++) {
        code --install-extension $extensions[$i]
    }
}

# Invoke new poweshell instance so code is in path
Start-Process powershell -ArgumentList "-command $installation_block"


###########################
## Create symbolik links ##
###########################

# .gitconfig
# New-Item -Force -ItemType SymbolicLink $HOME\ -Name .gitconfig -Value $HOME\dev\windows-dotfiles\git\.gitconfig


################################
## Outro                      ##
################################
echo ""
echo "Windows now has all programs installed"
echo "Execute the bootstrap-wsl.sh with alacritty in order to install the wsl-setup"s
echo ""
