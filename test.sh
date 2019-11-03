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
