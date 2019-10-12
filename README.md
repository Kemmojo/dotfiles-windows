# dotfiles-windows
Windoof, if something breaks and you need to reinstall, take my setting, i will try to keep it as simple as eating cheese cake.

# After a fresh installtion( Prequisites ) 
1. Check everything personal
2. ( For a little more help here ) Execute `backup.cmd`
 

# After a fresh installtion( Prequisites )
1. Update your System to the highest
2. ( If Nvidia ) Download **[Nvidia Geforce Experience](https://www.geforce.com/geforce-experience/download)**
    - Install newest drivers
3. Execute `bootstrap.cmd`


# So what is getting installed?
## Other
- KeePass

## Development
- WSL ( Windows Subsystem for Linux )
    - Ubuntu ( for bash )
    - Alacritty ( Graphicprocessor accellerated Terminal, written with Rust )
- XAMPP ( Linux / Apache / MySQL / PHP / Perl )
    - X-Debug
- Node/NPM
    - Sass
    - Typescript
    - asd

## Gaming
- Twitch-App
- Battle.net
- Steam
- asd


# Partitioning & Locations
**Short Disclaimer:** I love organisation and hate to search my butt flat,
So this Setup will consist of a subjective architecture, which might not hit your needs.

- **C:** (Place for: )
    - Windows per se
    - WSL + Development Environment
- **D:** ( Thirdparty Software/Apps/Programs )
- **E:** ( Gaming )





# Just Info
#################
# Windows Features

choco install TelnetClient -source windowsFeatures -y

############## 
# Fonts

choco install firacode -y

############## 
# Development

choco install dotpeek -y
choco install windbg -y
choco install ack -y

choco install keybase -y
choco install Gpg4win -y
choco install yubikey-manager -y

choco install linqpad5 -y
choco install fiddler -y
choco install curl -y

choco install javaruntime -y
choco install java.jdk -y

choco install git -y
choco install git-credential-manager-for-windows -y
choco install hub -y 
choco install poshgit -y
choco install githubforwindows -y
choco install gitkracken -y 

choco install python3 -y
choco install nodejs.install -y
choco install ruby -y
choco install ruby.devkit -y

############
# Multimedia

choco install snagit -y
choco install camtasia -y
choco install vlc -y
choco install youtube-dl -y
choco install flashplayerplugin -y

##############
# Web Browsers

choco install brave -v
choco install firefox -y
choco install googlechrome -y
choco install googlechrome.canary -y

choco install elinks -y
choco install lastpass -y

############
# Essentials

choco install vim -y
choco install sudo -y
choco install hyper -y
choco install keepass -y

choco install checksum -y

choco install 7zip -y
choco install 7zip.commandline -y

choco install foxitreader -y

choco install vscode -y
choco install visualstudiocode-insiders -y

choco install totalcommander -y
choco install rdcman -y

choco install imgburn -y
choco install deluge -y

choco install filezilla -y
choco install paint.net -y

##########
# Sysadmin

choco install sysinternals -y
choco install lockhunter -y

choco install teamviewer -y

choco install nmap -y
choco install wireshark -y
choco install windirstat -y
choco install dumeter -y

choco install winscp -y
choco install putty -y









 


