#!/bin/bash
set -e

# Install desktop and apps
sudo apt-get update
sudo apt-get install -y xfce4 xfce4-goodies xrdp libreoffice firefox vlc gimp gnome-calculator wget gnupg2 apt-transport-https ca-certificates software-properties-common

# Install Google Chrome
wget -q -O /tmp/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install -y /tmp/google-chrome.deb || sudo apt-get -f install -y
rm -f /tmp/google-chrome.deb

# Install VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg
sudo install -o root -g root -m 644 /tmp/microsoft.gpg /usr/share/keyrings/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install -y code

# Optional: install other CLI tools
sudo apt-get install -y curl git

echo "Installed repository-managed apps: Chrome, VS Code, LibreOffice, Firefox, VLC, GIMP, Calculator."