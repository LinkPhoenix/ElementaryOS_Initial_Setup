echo "change the default terminal by Terminator"

gsettings set org.gnome.desktop.default-applications.terminal exec terminator
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''

# echo "Default value for default terminal"
# gsettings reset org.gnome.desktop.default-applications.terminal exec
# gsettings reset org.gnome.desktop.default-applications.terminal exec-arg
#
