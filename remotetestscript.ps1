echo ""
echo ""
echo ""
echo "Installer initiated, your computer is about to be destroyed."
echo "Take care, cya."
echo ""
echo ""
echo ""

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))