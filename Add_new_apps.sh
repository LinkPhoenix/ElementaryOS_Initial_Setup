echo "Install Zsh"

sudo apt install zsh
chsh -s $(which zsh) #set zsh as default shell

echo "Backup zsh conf"

cd
cp ~/.zshrc ~/.zshrc.orig

echo "Install Oh My ZSH"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" #Via CURL
#sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" #Via WGET

echo "Install Terminator Terminal"

sudo apt install terminator

echo "Install Android File Transfer"

# https://askubuntu.com/questions/1038145/trying-to-install-android-file-transfer-ubuntu-18-04-bionic

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0BB4A1B2FA1A38EB
sudo add-apt-repository "deb http://ppa.launchpad.net/samoilov-lex/aftl-stable/ubuntu artful main"
sudo apt update
sudo apt install android-file-transfer

echo "install terminator"

sudo apt install terminator

# echo "install snap"

# sudo apt install snapd

echo "install Visual Code"

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code # or code-insiders

echo "Install Slack Desktop"

wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb

sudo apt install ./slack-desktop-*.deb

echo "Install Spotify with Snap"

curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client

echo "Install vlc Media Player"

sudo apt install vlc

echo "Install Thunderbird"

sudo apt install thunderbird

echo "Install Firefox"

sudo apt install firefox

echo "Install Vim"

sudo apt install vim

echo "Install Dconf Editor"

sudo apt install dconf-editor

echo "Install qBittorrent"

sudo apt install qbittorrent

echo "Install NeoFetch"

sudo apt install neofetch

echo "Install tree"

sudo apt install tree

echo "Install grub-customizer"

sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt update
sudo apt install grub-customizer

echo "Change GRUB_GFXMODE to 1280x1024 or 1024x768"

sudo sed -i 's%#GRUB_GFXMODE="640x480"%GRUB_GFXMODE=1280x1024,1024x768x32%g' /etc/default/grub
sudo update-grub

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
killall wingpanel

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
killall wingpanel