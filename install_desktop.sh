#!/usr/bin/env bash

setup_color() {
    # Only use colors if connected to a terminal
    # Thank your Oh My ZSH
    if [ -t 1 ]; then
        # https://gist.github.com/vratiu/9780109
        # https://misc.flogisoft.com/bash/tip_colors_and_formatting
        #RESET
        RESET=$(printf '\033[m')

        # Regular Colors
        BLACK=$(printf '\033[30m')
        RED=$(printf '\033[31m')
        GREEN=$(printf '\033[32m')
        YELLOW=$(printf '\033[33m')
        BLUE=$(printf '\033[34m')
        MAGENTA=$(printf '\033[35m')
        CYAN=$(printf '\033[36m')
        WHITE=$(printf '\033[37m')

        #BACKGROUND
        BG_BLACK=$(printf '\033[40m')
        BG_RED=$(printf '\033[41m')
        BG_GREEN=$(printf '\033[42m')
        BG_YELLOW=$(printf '\033[43m')
        BG_BLUE=$(printf '\033[44m')
        BG_MAGENTA=$(printf '\033[45m')
        BG_CYAN=$(printf '\033[46m')
        BG_WHITE=$(printf '\033[47m')

        # Formatting
        BOLD=$(printf '\033[1m')
        DIM=$(printf '\033[2m')
        ITALIC=$(printf '\033[3m')
        UNDERLINE=$(printf '\033[4m')
        BLINK=$(printf '\033[5m')
        REVERSE=$(printf '\033[7m')

    else
        RESET=""

        # Regular Colors
        BLACK=""
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        MAGENTA=""
        CYAN=""
        WHITE=""

        #BACKGROUND
        BG_BLACK=""
        BG_RED=""
        BG_GREEN=""
        BG_YELLOW=""
        BG_BLUE=""
        BG_MAGENTA=""
        BG_CYAN=""
        BG_WHITE=""

        # Formatting
        BOLD=""
        DIM=""
        ITALIC=""
        UNDERLINE=""
        BLINK=""
        REVERSE=""
    fi
}

press_any_key_to_continue() {
    read -n 1 -s -r -p "${GREEN}${BOLD}Press any key to continue${RESET}"
    printf "\n"
}

launching_command() {
    echo "${YELLOW}#######################################################${RESET}"
    echo "${BG_BLACK}${ITALIC}  $ $1 ${RESET}"
    echo "${YELLOW}#######################################################${RESET}"
}

header() {
    echo ""
    echo "${YELLOW}#######################################################${RESET}"
    echo ""
    echo "${GREEN}  $1 ${RESET}"
    echo ""
    echo "${YELLOW}#######################################################${RESET}"
    echo ""
    echo ""
    press_any_key_to_continue
}

warning_text() {
    echo ""
    echo "${RED}#######################################################${RESET}"
    echo "${RED}${BOLD}  $1 ${RESET}"
    echo "${RED}#######################################################${RESET}"
    echo ""
    press_any_key_to_continue
}

detect_text() {
    echo ""
    echo "${GREEN}#######################################################${RESET}"
    echo "${GREEN}${BOLD}  $1 ${RESET}"
    echo "${GREEN}#######################################################${RESET}"
    echo ""
    press_any_key_to_continue
}

setup_color

header "UPDATE & UPGRADE"

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade

header "INSTALL ALL DEPENDENCIES"

launching_command "sudo apt install make"
sudo apt install make

launching_command "sudo apt install gcc"
sudo apt install gcc

launching_command "software-properties-common"
sudo apt install software-properties-common

launching_command "fonts-powerline"
sudo apt install fonts-powerline


header "REMOVE UNLESS ELEMENTARY APPS"

launching_command "sudo apt remove epiphany io.elementary.code"
sudo apt remove epiphany io.elementary.code

# ZSH INSTALL
header "OH MY ZSH installation"

if hash zsh 2>/dev/null; then
    detect_text "ZSH has been detected on your system"
else
    warning_text "Zsh has not detected on your system"
    echo "${YELLOW}I will install it with sudo${RESET}"
    launching_command "sudo apt install zsh"
    press_any_key_to_continue
    sudo apt install zsh
    if hash curl 2>/dev/null; then
        detect_text "CURL has been detected on your system"
        echo "${YELLOW}I will install OH MY ZSH with it${RESET}"
        launching_command "sh -c \$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        press_any_key_to_continue
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    elif hash wget 2>/dev/null; then
        detect_text "WGET has been detected on your system"
        echo "${YELLOW}I will install OH MY ZSH with it${RESET}"
        launching_command "sh -c \$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
        press_any_key_to_continue
        sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    else
        warning_text "CURL and WGET has not detected on your system"
        echo "${YELLOW}I will install CURL with sudo${RESET}"
        echo "${YELLOW}before install Oh-My-Zsh${RESET}"
        launching_command "sudo apt install curl"
        press_any_key_to_continue
        sudo apt install curl
        echo "${YELLOW}Now I will install OH MY ZSH with CURL${RESET}"
        launching_command "sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)""
        press_any_key_to_continue
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
fi

#Vim install

header "VIM installation"

if hash vim 2>/dev/null; then
    detect_text "Vim is already installed"
    press_any_key_to_continue
else
    warning_text "Vim has not detected on your system"
    echo "${YELLOW}I will install it with sudo${RESET}"
    launching_command "sudo apt install vim"
    press_any_key_to_continue
    sudo apt install vim
fi


#Visual Code Install

header "Visual Code Installation"

if hash code 2>/dev/null; then
    detect_text "Visual Code is already installed"
    press_any_key_to_continue
else
    warning_text "Visual code has not detected on your system"
    echo "I will install it"
    press_any_key_to_continue
    launching_command "curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg"
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    launching_command "sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/"
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    launching_command "sudo sh -c echo deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main > /etc/apt/sources.list.d/vscode.list"
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    launching_command "sudo apt install apt-transport-https"
    sudo apt install apt-transport-https
    launching_command "sudo apt update"
    sudo apt update
    launching_command "sudo apt install code"
    sudo apt install code
    launching_command "code --install-extension shan.code-settings-sync"
    code --install-extension shan.code-settings-sync
fi

##TERMINATOR
header "TERMINATOR INSTALL"

launching_command "sudo apt install terminator"
sudo apt install terminator

##SLACK
header "Install Slack Desktop"

wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb

sudo apt install ./slack-desktop-*.deb

##SPOTIFY
header "Install Spotify"

curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client

##SPOTIFY ADBLOCK
header "Install Sotify AdBlock"

#https://github.com/abba23/spotify-adblock-linux
sudo apt install libcurl4-gnutls-dev
git clone https://github.com/abba23/spotify-adblock-linux.git
cd spotify-adblock-linux
make

##FIREFOX
header "Install Firefox"

sudo apt install firefox

##NEOFETCH
header "Install NeoFetch"

sudo apt install neofetch

##TREE
header "Install tree"

sudo apt install tree

##GRUB CUSTOMIZER
echo "Install grub-customizer"

sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt update
sudo apt install grub-customizer

##GPARTED
header "Install Gparted"

sudo apt install gparted

##DOLPHIN EMULKATOR
header "DOLPHIN EMULATOR INSTALL"
sudo apt-add-repository ppa:dolphin-emu/ppa
sudo apt update
sudo apt install dolphin-emu

##STEAM
header "STEAM INSTALL"
sudo apt install steam-installer

##INSTALL ANDROID FILE TRANSFER
header "INSTALL ANDROID FILE TRANSFER"
sudo add-apt-repository "deb http://ppa.launchpad.net/samoilov-lex/aftl-stable/ubuntu artful main"
sudo apt install android-file-transfer

##KODI
header "INSTALL KODI"
sudo apt install software-properties-common
sudo add-apt-repository ppa:team-xbmc/ppa
sudo apt update
sudo apt install kodi

#ELEMENTARY TWEAKS
header "Install Elementary-Tweaks"
sudo add-apt-repository -y  ppa:philip.scott/elementary-tweaks
sudo apt update
sudo apt install elementary-tweaks

#CHANGE SHELL TO TERMINATOR
header "change the default terminal by Terminator"

gsettings set org.gnome.desktop.default-applications.terminal exec terminator
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''

# echo "Default value for default terminal"
# gsettings reset org.gnome.desktop.default-applications.terminal exec
# gsettings reset org.gnome.desktop.default-applications.terminal exec-arg

##MAC OS THEME
header "install Mac OS Theme"

#https://github.com/surajmandalcell/elementary-x
git clone https://github.com/surajmandalcell/elementary-x.git ~/.themes/elementary-x
gsettings set org.gnome.desktop.interface gtk-theme "elementary-x"

##CONFIG DARK MODE
header "Config DARK MODE"

#https://askubuntu.com/questions/769417/how-to-change-global-dark-theme-on-and-off-through-terminal
#https://askubuntu.com/questions/20414/find-and-replace-text-within-a-file-using-commands
GTK_CONFIG=~/.config/gtk-3.0/settings.ini
if [ -f "$GTK_CONFIG" ]; then
    echo "$GTK_CONFIG exist"
    sed -i 's/gtk-application-prefer-dark-theme=0/gtk-application-prefer-dark-theme=1/g' ~/.config/gtk-3.0/settings.ini
else
    touch ~/.config/gtk-3.0/settings.ini
    echo [Settings] >> ~/.config/gtk-3.0/settings.ini
    echo gtk-application-prefer-dark-theme=1 >> ~/.config/gtk-3.0/settings.ini
fi 


##ICON MAC
header "Install icon theme Mac os La Sierra"

https://github.com/btd1337/La-Sierra-Icon-Theme
git clone https://github.com/btd1337/La-Sierra-Icon-Theme ~/.icons/La-Sierra
gsettings set org.gnome.desktop.interface icon-theme "La-Sierra"

##TRASH ICON
header "Add trash icone in the dock"

#https://elementaryos.stackexchange.com/questions/18404/where-is-the-trash-icon/21088#21088
touch $HOME/.config/plank/dock1/launchers/trash.dockitem
sed -i 's%Launcher=%Launcher=docklet://trash%g' $HOME/.config/plank/dock1/launchers/trash.dockitem
killall plank

##DOWNLOAD TO DOCK
header "Add download icone in the dock"

touch $HOME/.config/plank/dock1/launchers/Downloads.dockitem
sed -i "s%Launcher=%Launcher=//$HOME/Downloads%g" $HOME/.config/plank/dock1/launchers/trash.dockitem
killall plank


##PLANK ICONE
header "Add plank icone in the launcher"

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

##SPOTIFY ADBLOCK ICON
header "Add Spotify AdBlock in the launcher"

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

##CLEAN

sudo apt autoremove