#!/usr/bin/env bash

if [ -t 1 ]; then
    RED=$(printf '\033[31m')
    GREEN=$(printf '\033[32m')
    YELLOW=$(printf '\033[33m')
    BLUE=$(printf '\033[34m')
    BOLD=$(printf '\033[1m')
    RESET=$(printf '\033[m')
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    RESET=""
fi


sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt install make
sudo apt install gcc
sudo apt install software-properties-common
sudo apt install fonts-powerline

echo "Remove Code, Epiphany Browser"
sudo apt remove epiphany io.elementary.code


# ZSH INSTALL

if hash zsh 2>/dev/null; then
    echo "${YELLOW}ZSH has been detected on your system${RESET}"

else
    echo "${YELLOW}Zsh has not detected on your system${RESET}"
    echo "${YELLOW}I will install it with sudo${RESET}"

    sudo apt install zsh
fi

if hash curl 2>/dev/null; then
    echo "${GREEN}CURL has been detected on your system${RESET}"
    echo "${YELLOW}I will install OH MY ZSH with it${RESET}"

    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
elif hash wget 2>/dev/null; then
    echo "${GREEN}WGET has been detected on your system${RESET}"
    echo "${YELLOW}I will install OH MY ZSH with it${RESET}"

    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
else
    echo "${RED}CURL and WGET has not detected on your system${RESET}"
    echo "${YELLOW}I will install CURL with sudo${RESET}"
    echo "${YELLOW}before install Oh-My-Zsh${RESET}"

    sudo apt install curl
    echo "${YELLOW}Now I will install OH MY ZSH with CURL${RESET}"

    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
echo "${GREEN}Oh My Zsh is now Installed${RESET}"

#Vim install

if hash vim 2>/dev/null; then
    echo "${YELLOW}Vim is already installed${RESET}"
    
else
    echo "${RED}Vim has not detected on your system${RESET}"
    echo "${YELLOW}I will install it with sudo${RESET}"
    
    sudo apt install vim
    
fi

#Visual Code Install

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code # or code-insiders

echo "Install Terminator Terminal"

sudo apt install terminator

echo "Install Slack Desktop"

wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb

sudo apt install ./slack-desktop-*.deb

echo "Install Spotify"

curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client

echo "Install Firefox"

sudo apt install firefox

echo "Install NeoFetch"

sudo apt install neofetch

echo "Install tree"

sudo apt install tree

echo "Install grub-customizer"

sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt update
sudo apt install grub-customizer

echo "Add plank icone in the launcher"

#https://unix.stackexchange.com/questions/382946/getting-permission-denied-when-trying-to-append-text-onto-a-file-using-sudo
sudo touch /usr/share/applications/plank-preferences.desktop
echo '[Desktop Entry]' | sudo tee -a /usr/share/applications/plank-preferences.desktop
echo 'Name=Plank preferences' | sudo tee -a /usr/share/applications/plank-preferences.desktop
echo 'Comment=Dock plank preferences' | sudo tee -a /usr/share/applications/plank-preferences.desktop
echo 'Exec=plank --preferences' | sudo tee -a /usr/share/applications/plank-preferences.desktop
echo 'Icon=plank' | sudo tee -a /usr/share/applications/plank-preferences.desktop
echo 'Terminal=false' | sudo tee -a /usr/share/applications/plank-preferences.desktop
echo 'Type=Application' | sudo tee -a /usr/share/applications/plank-preferences.desktop
echo 'StartupNotify=false' | sudo tee -a /usr/share/applications/plank-preferences.desktop
echo 'Categories=GNOME;GTK;System;' | sudo tee -a /usr/share/applications/plank-preferences.desktop

echo "Install Sotify AdBlock"

#https://github.com/abba23/spotify-adblock-linux
sudo apt install libcurl4-gnutls-dev
git clone https://github.com/abba23/spotify-adblock-linux.git
cd spotify-adblock-linux
make

echo "Add Spotify AdBlock in the launcher"

sudo touch /usr/share/applications/spotify-adblock.desktop
echo '[Desktop Entry]' | sudo tee -a /usr/share/applications/spotify-adblock.desktop
echo 'Type=Application' | sudo tee -a /usr/share/applications/spotify-adblock.desktop
echo 'Name=Spotify (adblock)' | sudo tee -a /usr/share/applications/spotify-adblock.desktop
echo 'GenericName=Music Player' | sudo tee -a /usr/share/applications/spotify-adblock.desktop
echo 'Icon=spotify-client' | sudo tee -a /usr/share/applications/spotify-adblock.desktop
echo 'TryExec=spotify' | sudo tee -a /usr/share/applications/spotify-adblock.desktop
echo 'Exec=env LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify %U' | sudo tee -a /usr/share/applications/spotify-adblock.desktop
echo 'Terminal=false' | sudo tee -a /usr/share/applications/spotify-adblock.desktop
echo 'MimeType=x-scheme-handler/spotify;' | sudo tee -a /usr/share/applications/spotify-adblock.desktop
echo 'Categories=Audio;Music;Player;AudioVideo;' | sudo tee -a /usr/share/applications/spotify-adblock.desktop
echo 'StartupWMClass=spotify' | sudo tee -a /usr/share/applications/spotify-adblock.desktop


echo "Install Elementary-Tweaks"
sudo add-apt-repository -y  ppa:philip.scott/elementary-tweaks
sudo apt-get update
sudo apt-get install elementary-tweaks

echo "add actual user in input's group"

sudo gpasswd -a $USER input

echo "You need restart your PC or logon and login"
echo ""
echo "Dependancies installation"

sudo apt-get install xdotool wmctrl
sudo apt-get install libinput-tools

echo "Download the Github"

git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install

sudo rm -rf libinput-gestures

libinput-gestures-setup autostart
libinput-gestures-setup start

echo "change the default terminal by Terminator"

gsettings set org.gnome.desktop.default-applications.terminal exec terminator
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''

# echo "Default value for default terminal"
# gsettings reset org.gnome.desktop.default-applications.terminal exec
# gsettings reset org.gnome.desktop.default-applications.terminal exec-arg

echo "install Mac OS Theme"

#https://github.com/surajmandalcell/elementary-x
git clone https://github.com/surajmandalcell/elementary-x.git ~/.themes/elementary-x
gsettings set org.gnome.desktop.interface gtk-theme "elementary-x"

echo "Config DARK MODE"

#https://askubuntu.com/questions/769417/how-to-change-global-dark-theme-on-and-off-through-terminal
#https://askubuntu.com/questions/20414/find-and-replace-text-within-a-file-using-commands
sed -i 's/gtk-application-prefer-dark-theme=0/gtk-application-prefer-dark-theme=1/g' ~/.config/gtk-3.0/settings.ini

echo "Install icon theme Mac os La Sierra"

https://github.com/btd1337/La-Sierra-Icon-Theme
git clone https://github.com/btd1337/La-Sierra-Icon-Theme ~/.icons/La-Sierra
gsettings set org.gnome.desktop.interface icon-theme "La-Sierra"

echo "Add trash icone in the dock"

#https://elementaryos.stackexchange.com/questions/18404/where-is-the-trash-icon/21088#21088
touch $HOME/.config/plank/dock1/launchers/trash.dockitem
sed -i 's%Launcher=%Launcher=docklet://trash%g' $HOME/.config/plank/dock1/launchers/trash.dockitem
killall plank

echo "Add download icone in the dock"

touch $HOME/.config/plank/dock1/launchers/Downloads.dockitem
sed -i "s%Launcher=%Launcher=//$HOME/Downloads%g" $HOME/.config/plank/dock1/launchers/trash.dockitem
killall plank


echo "Install Gparted"

sudo apt install gparted