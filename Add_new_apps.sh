echo "Install Terminator Terminal"

sudo apt install terminator
 
echo "install Snap On Elementary OS"
 
sudo apt update
sudo apt install snapd

echo "Install Visual Code with Snap"
 
sudo snap install --classic code

echo "Install Slack Desktop"

wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb

sudo apt install ./slack-desktop-*.deb

echo "Install Spotify with Snap"

snap install spotify

#echo "Install Spotify"
#curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
#echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
#sudo apt-get update && sudo apt-get install spotify-client

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
