echo "Install San Francisco Font"

git clone https://github.com/AppleDesignResources/SanFranciscoFont
sudo mkdir /usr/share/fonts/truetype/SanFrancisco
sudo cp SanFranciscoFont/* /usr/share/fonts/truetype/SanFrancisco/
sudo rm -rf SanFranciscoFont
sudo fc-cache -fv
