#!/usr/bin/env sh
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

# echo "Disable touchscreen at startup"

# sudo -i
# mkdir /autostart_script
# touch /autostart_script/disable_touchscreen.sh
# echo '#!/usr/bin/env bash' >>/autostart_script/disable_touchscreen.sh
# echo 'xinput disable 12' >>/autostart_script/disable_touchscreen.sh
# chmod +x /autostart_script/disable_touchscreen.sh

# touch /etc/init/disable_touchscreen.conf
# echo 'description     "Disable the Touchscreen"' >>/etc/init/disable_touchscreen.conf
# echo 'start on startup' >>/etc/init/disable_touchscreen.conf
# echo 'task' >>/etc/init/disable_touchscreen.conf
# echo 'exec /autostart_script/disable_touchscreen.sh' >>/etc/init/disable_touchscreen.conf
# exit