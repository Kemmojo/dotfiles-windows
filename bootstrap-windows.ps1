## Welcome
echo "Welcome to Kemojos Windows-Bootstrap Script"
echo ""

######################
## PowerShell setup ##
######################

# Set execution policy to remote signed
Set-ExecutionPolicy Bypass

# Set network category to private
# Set-NetConnectionProfile -NetworkCategory Private


#########################################
## WSL ( Windows Subsystem for Linux ) ##
#########################################
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux


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
choco.exe install steam -y
choco.exe install epicgameslauncher -y
choco.exe install origin -y
choco.exe install leagueoflegends -y
choco.exe install obs-studio -y
choco.exe install streamlabs-obs -y
choco.exe install teamspeak -y
choco.exe install twitch -y
choco.exe install discord -y
choco.exe install whatsapp -y

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

# Install Powerline Font
cd $HOME/Downloads
git clone https://github.com/powerline/fonts.git
& .\fonts\install.ps1
cd $HOME

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
#   1. Windows -> Control Panel -> Keyboard -> Character repeat delay -> fast
#   2. Windows -> Registry editor -> HKEY_CURRENT_USER -> Control Panel -> Keyboard -> KeyboardSpeed -> 60


################################
## Install VS Code Extensions ##
################################
$installation_block = {
    $extensions =
        'yzhang.markdown-all-in-one',
        'mrmlnc.vscode-apache',
        'eiminsasete.apacheconf-snippets',
        'formulahendry.auto-rename-tag',
        'hnw.vscode-auto-open-markdown-preview',
        'luggage66.awk',
        'mgmcdermott.vscode-language-babel',
        'hookyqr.beautify',
        'wwm.better-align',
        'coenraads.bracket-pair-colorizer',
        'demijollamaxime.bulma',
        'formulahendry.code-runner',
        'bierner.color-info',
        'anseki.vscode-color',
        'alexdima.copy-relative-path',
        'pranaygp.vscode-css-peek',
        'ms-azuretools.vscode-docker',
        'mikestead.dotenv',
        'vilicvane.es-quotes',
        'vincaslt.highlight-matching-tag',
        'sidthesloth.html5-boilerplate',
        'mkaufman.htmlhint',
        'bradgashler.htmltagwrap',
        'zignd.html-css-class-completion',
        'xabikos.javascriptsnippets',
        'redhat.java',
        'austenc.laravel-blade-spacer',
        'codingyu.laravel-goto-view',
        'cjhowe7.laravel-blade',
        'stef-k.laravel-goto-controller',
        'bierner.markdown-emoji',
        'bat67.markdown-extension-pack',
        'yzane.markdown-pdf',
        'shd101wyy.markdown-preview-enhanced',
        'bierner.markdown-preview-github-styles',
        'mdickin.markdown-shortcuts',
        'darkriszty.markdown-table-prettify',
        'alanwalk.markdown-toc',
        'goessner.mdmath',
        'davidanson.vscode-markdownlint',
        'leizongmin.node-module-intellisense',
        'christian-kohler.npm-intellisense',
        'whizkydee.material-palenight-theme',
        'christian-kohler.path-intellisense',
        'felixfbecker.php-debug',
        'felixfbecker.php-pack',
        'sophisticode.php-formatter',
        'felixfbecker.php-intellisense',
        'kokororin.vscode-phpfmt',
        'esbenp.prettier-vscode',
        'kogai.regex-railroad-diagrams',
        'robinbentley.sass-indented',
        'shan.code-settings-sync',
        'kyleetehkitty.starboundjson',
        'henoc.svgeditor',
        'cssho.vscode-svgviewer',
        'wayou.vscode-todo-highlight',
        'minhthai.vscode-todo-parser',
        'britesnow.vscode-toggle-quotes',
        'ilich8086.untabify',
        'deerawan.vscode-faker',
        'tomoki1207.pdf',
        'jrebocho.vscode-random',
        'sdras.vue-vscode-extensionpack',
        'sdras.vue-vscode-snippets',
        'gamunu.vscode-yarn',
        'samverschueren.yo',
        'ms-vscode.csharp',
        'ms-python.python',
        'ms-vscode.powershell',
        'ms-mssql.mssql',
        'ms-vsliveshare.vsliveshare',
        'pkief.material-icon-theme',
        'ritwickdey.LiveServer',
        'sidneys1.gitconfig',
        'Tyriar.sort-lines',
        'VisualStudioExptTeam.vscodeintellicode',
        'yycalm.linecount',
        'equinusocio.vsc-material-theme'

    for ($i = 0; $i -lt $extensions.Count; $i++) {
        code --install-extension $extensions[$i]
    }
}

# Invoke new poweshell instance so code is in path
Start-Process powershell -ArgumentList "-command $installation_block"


################################
## Outro                      ##
################################
# TODO: Download Applications from Sources
echo ""
echo "Things you have to install manually:"
echo " - Twitch"
echo " - Battle.net"
echo " - Flowkey"
echo " - XING"
echo " - FL Studio"
echo " - iCUE"
echo " - Alesis V61 Editor"
echo " - Adobe Photoshop"
echo " - Adobe XD"
echo " - ISO Handling -> deamon tools lite"
echo " - Adobe Cloude + Adobe XD"
echo ""
echo ""
echo "Windows now has all programs installed"
echo "Go back to the dotfiles repository and follow the rest of the installation guide.
echo ""
