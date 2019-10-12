## Welcome
echo Welcome to Kemojos Windows-Bootstrap Script
echo

######################
## PowerShell setup ##
######################

# Set execution policy to remote signed
Set-ExecutionPolicy RemoteSigned

# Set network category to private
Set-NetConnectionProfile -NetworkCategory Private


########################
## Install choco.exelatey ##
########################

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://choco.exelatey.org/install.ps1'))


########################
## Install software   ##
########################
# Fonts
choco.exe install firacode -y

# Developent
choco.exe install git -y
choco.exe install git-credential-manager-for-windows -y
choco.exe install javaruntime -y
choco.exe install java.jdk -y

# Browser
choco.exe install firefox -y
choco.exe install googlechrome -y
choco.exe install googlechrome.canary -y
choco.exe install opera -y

# Essentials
choco.exe install alacritty -y
choco.exe install keepass -y
choco.exe install 7zip -y
choco.exe install 7zip.commandline -y
choco.exe install winrar -y
choco.exe install totalcommander -y
choco.exe install filezilla -y

# Sysadmin
choco.exe install teamviewer -y
choco.exe install nmap -y
choco.exe install wireshark -y

# Editor & IDEs
choco.exe install vim -y
choco.exe install vscode -y
choco.exe install visualstudiocode-insiders -y

# Multimedia
choco.exe install youtube-dl -y
choco.exe install vlc -y
choco.exe install spotify -y

## Other
choco.exe install malwarebytes -y

# Gaming & Communication
choco.exe install battle.net -y
choco.exe install steam -y
choco.exe install obs-studio -y
choco.exe install teamspeak -y
choco.exe install twitch -y
choco.exe install discord -y

# Note taking
choco.exe install joplin -y

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

# ConEmu Settings
# New-Item -Force -ItemType SymbolicLink $HOME\AppData\Roaming -Name ConEmu.xml -Value $HOME\dev\windows-dotfiles\ConEmu\ConEmu.xml

################################
## Outro                      ##
################################
echo
echo You are all setup and ready, have fun.
echo

