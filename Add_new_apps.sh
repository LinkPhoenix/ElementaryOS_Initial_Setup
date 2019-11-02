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
