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

