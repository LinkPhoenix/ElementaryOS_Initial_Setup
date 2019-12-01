#!/bin/bash

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

ask() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
    [yY][eE][sS] | [yY])
        $1
        ;;
    *)
        continue
        ;;
    esac
}

header() {
    clear
    echo ""
    echo "${YELLOW}#######################################################${RESET}"
    echo ""
    echo "${GREEN}  $1 ${RESET}"
    echo ""
    echo "${YELLOW}#######################################################${RESET}"
    echo ""
    echo ""
}

footer() {
    echo ""
    echo "${GREEN}${BOLD}#######################################################${RESET}"
    echo ""
    echo "${GREEN}  $1 ${RESET}"
    echo ""
    echo "${GREEN}${BOLD}#######################################################${RESET}"
    echo ""
}

launching_command() {
    echo "${YELLOW}#######################################################${RESET}"
    echo "${BG_BLACK}${ITALIC}  $ $1 ${RESET}"
    echo "${YELLOW}#######################################################${RESET}"
}

warning_text() {
    echo ""
    echo "${RED}#######################################################${RESET}"
    echo "${RED}${BOLD}  $1 ${RESET}"
    echo "${RED}#######################################################${RESET}"
    echo ""
}

detect_text() {
    echo ""
    echo "${GREEN}#######################################################${RESET}"
    echo "${GREEN}${BOLD}  $1 ${RESET}"
    echo "${GREEN}#######################################################${RESET}"
    echo ""
}

information() {
    echo ""
    echo "${RED}${BOLD}#######################################################${RESET}"
    echo "${RED}${BOLD}${BG_BLACK}                                                       ${RESET}"
    echo "${RED}${BOLD}  $1 ${RESET}"
    echo "${RED}${BOLD}  $2 ${RESET}"
    echo "${RED}${BOLD}${BG_BLACK}                                                       ${RESET}"
    echo "${RED}${BOLD}#######################################################${RESET}"
    echo ""
    press_any_key_to_continue
}

install_oh_my_zsh() {
    header "OH MY ZSH installation"

    press_any_key_to_continue

    if hash zsh 2>/dev/null; then
        detect_text "ZSH has been detected on your system"
        press_any_key_to_continue
    else
        warning_text "Zsh has not detected on your system"
        echo "${YELLOW}I will install it with sudo${RESET}"
        launching_command "sudo apt install zsh"
        press_any_key_to_continue
        sudo apt install zsh
    fi

    information "After installing OH MY ZSH you will have to leave" "the SHELL by typing EXIT to continue the script"

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
    footer "OH MY ZSH INSTALLATION END"
    press_any_key_to_continue
}

install_vim() {
    header "VIM installation"

    press_any_key_to_continue

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

    footer "VIM INSTALLATON END"

    press_any_key_to_continue
}

Install_vscode() {
    header "Visual Code Installation"

    press_any_key_to_continue

    if hash code 2>/dev/null; then
        detect_text "Visual Code is already installed"
        press_any_key_to_continue
    else
        warning_text "Visual code has not detected on your system"
        echo "I will install it"
        press_any_key_to_continue
        launching_command "curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg"
        curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
        launching_command "sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/"
        sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
        launching_command "sudo sh -c echo deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main > /etc/apt/sources.list.d/vscode.list"
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        launching_command "sudo apt-get install apt-transport-https"
        sudo apt-get install apt-transport-https
        launching_command "sudo apt-get update"
        sudo apt-get update
        launching_command "sudo apt-get install code"
        sudo apt-get install code
    fi

    footer "VISUAL CODE INSTALLATION END"

    press_any_key_to_continue
}


Install_atom() {
    header "Atom Installation"

    press_any_key_to_continue

    if hash atom 2>/dev/null; then
        detect_text "Atom is already installed"
        press_any_key_to_continue
    else
        warning_text "Atom has not detected on your system"
        echo "I will install it"
        press_any_key_to_continue
        launching_command "wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -"
        wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
        launching_command "sudo sh -c echo deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main > /etc/apt/sources.list.d/atom.list"
        sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
        launching_command "sudo apt update"
        sudo apt update
        launching_command "sudo apt-get install atom"
        sudo apt install atom
    fi

    footer "ATOM INSTALLATION END"

    press_any_key_to_continue
}

Install_sublime_text() {
    header "Sublime Text Installation"

    press_any_key_to_continue

    if hash subl 2>/dev/null; then
        detect_text "Sublime Text is already installed"
        press_any_key_to_continue
    else
        warning_text "Sublime Text has not detected on your system"
        echo "I will install it"
        press_any_key_to_continue
        launching_command "wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -"
        wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
        launching_command "sudo apt install apt-transport-https"
        sudo apt install apt-transport-https
        launching_command "echo deb https://download.sublimetext.com/ apt/stable/ | sudo tee /etc/apt/sources.list.d/sublime-text.list"
        echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
        launching_command "sudo apt update"
        sudo apt update
        launching_command "sudo apt-get install sublime-text"
        sudo apt install sublime-text
    fi

    footer "SUBLIME TEXT INSTALLATION END"

    press_any_key_to_continue
}

install_git() {
    header "INSTALL GIT"

    if hash git 2>/dev/null; then
        detect_text "GIT is already installed"
        press_any_key_to_continue
    else
        warning_text "GIT has not detected on your system"
        echo "I will install it"
        launching_command "sudo apt update"
        sudo apt update
        launching_command "sudo apt install git"
        sudo apt install git
        press_any_key_to_continue
    fi

    footer "GIT INSTALLATION END"

    press_any_key_to_continue
}

config_git() {
    header "CONFIGURATION GIT GLOBAL"

    GIT_CONFIG_FILE="$HOME/.gitconfig"
    if [[ -f "$GIT_CONFIG_FILE" ]]; then
        information "A configuration is already configured," "be sure to want to redo a configuration"
        echo "${YELLOW}Here is the current configuration :${RESET}"
        cat $HOME/.gitconfig
        echo "${YELLOW}################################################${RESET}"
        echo "${YELLOW}If you want to leave the script press [CTRL + C]${RESET}"
        echo "${YELLOW}################################################${RESET}"
        echo ""
        press_any_key_to_continue
    fi
    echo "${YELLOW}Type in your first and last name or just pseudo (no accent or special characters - e.g. 'ç'): ${YELLOW}"
    read full_name
    echo ""
    echo "${YELLOW}Type in your email address, the one used for your GitHub account: ${YELLOW}"
    read email

    launching_command "git config --global user.email $email"
    git config --global user.email $email
    echo ""
    launching_command "git config --global user.email $full_name"
    git config --global user.name $full_name

    echo "${YELLOW}This is your new config${RESET}"
    launching_command "cat $HOME/.gitconfig"
    cat $HOME/.gitconfig

    footer "GIT CONFIG GLOBAL END"

    press_any_key_to_continue
}

checking_for_existing_ssh_keys() {
    header "Checking for existing SSH keys"

    SSH_KEY_FOLDER="$HOME/.ssh"
    if [[ -f "$SSH_KEY_FOLDER/id_rsa.pub" ]]; then
        detect_text "You have already RSA KEY"
        echo "${YELLOW}Here is your KEY :${RESET}"
        cat $SSH_KEY_FOLDER/id_rsa.pub
    elif [[ -f "$SSH_KEY_FOLDER/id_ecdsa.pub" ]]; then
        detect_text "You have already ECDSA KEY"
        echo "${YELLOW}Here is your KEY :${RESET}"
        cat $SSH_KEY_FOLDER/id_ecdsa.pub
    elif [[ -f "$SSH_KEY_FOLDER/ed25519.pub" ]]; then
        detect_text "You have already ED25519 KEY"
        echo "${YELLOW}Here is your KEY :${RESET}"
        cat $SSH_KEY_FOLDER/id_ed25519.pub
    else
        warning_text "You do not have key"
    fi

    footer "END OF DETECTION KEY"

    press_any_key_to_continue
}

install_terminator() {
    header "TERMINATOR INSTALL"

    if hash terminator 2>/dev/null; then
        detect_text "TERMINATOR is already installed"
        press_any_key_to_continue
    else
        warning_text "TERMINATOR has not detected on your system"
        echo "I will install it"
        launching_command "sudo apt install terminator"
        sudo apt install terminator
    fi

    footer "TERMINATOR INSTALLATION END"

    press_any_key_to_continue
}

choice_IDE() {
    if hash resize 2>/dev/null; then
        eval $(resize)
        CHOICE=$(whiptail --title "Installfest - The Hacking Project" --menu "By LinkPhoenix" --nocancel --notags --clear $LINES $(($COLUMNS - 75)) $(($LINES - 8)) \
            "1)" "Visual Code" \
            "2)" "Atom" \
            "3)" "Sublime Text" 3>&2 2>&1 1>&3)
    else
        CHOICE=$(whiptail --title "Installfest - The Hacking Project" --menu "By LinkPhoenix" --nocancel --notags --clear 15 45 5 \
            "1)" "Visual Code" \
            "2)" "Atom" \
            "3)" "Sublime Text" 3>&2 2>&1 1>&3)
    fi

    case $CHOICE in
    "1)") Install_vscode ;;
    "2)") Install_atom ;;
    "3)") Install_sublime_text ;;
    esac
}

end_of_script() {
    clear
    exit
}

add_full_alias() {
	header "INSTALLATION ALIAS"

if [ -f ~/.zshrc ]; then
	FILE_ALIAS=$HOME/.zshrc
	detect_text "$FILE_ALIAS exist, I write alias in this file"

	press_any_key_to_continue
elif [ -f ~/.bashrc ]; then
	FILE_ALIAS=$HOME/.bashrc
	detect_text "$FILE_ALIAS exist, I write alias in this file"

	press_any_key_to_continue
fi

ALIAS="
# SYSTEM ALIAS
alias cls='clear'									# Clear the terminal
alias c='clear'										# Clear the terminal
alias h='history'									# Print bash command history
alias ll='ls -l' 									# List files in a list
alias la='ls -al'									# List files in a list with hidden files
# GIT ALIAS
alias gitalias='alias | grep git'					# Show all alias for git (if you have OH MY ZSH you have lots of other aliases)
alias gs='git status'								# Show the working tree status
alias gcl='git clone'								# Clone a repository into a new directory
alias gpush='git push'								# Update remote refs along with associated objects
alias gpull='git pull'								# Fetch from and integrate with another repository or a local branch
alias ga='git add'									# Add file contents to the index
alias gcm='git commit -m'							# Record changes to the repository
alias gco='git checkout'							# Switch branches or restore working tree files
alias gbr='git branch'								# List, create, or delete branches
alias glog='git log'								# Show commit logs
alias greset='git reset'							# Reset current HEAD to the specified state
# BUNDLE ALIAS
alias bundlealias='alias | grep bundle'				# Show all alias for bundle
alias bi='bundle install'							# Install the current environment to the system
alias bl='bundle list'								# List all gem in GEMFILE and version
alias bu='bundle update'							# Update the current environment (update gem)
alias ba='bundle add'								# Command for add multiple gem in gemfile and launch a bundle update
# HEROKU ALIAS
alias herokualias='alias | grep heroku'				# Show all alias for Heroku
alias hrdbs='heroku run rake db:seed'
alias hrdbm='heroku run rails db:migrate'
alias hc='heroku create'
alias hrrc='heroku run rails console'
alias hrbi='heroku run bundle install'
alias hrupdate='heroku update'						# Update the Heroku CLI
alias hrpsql='heroku psql'							# Open a psql shell to the database
alias hrlogs='heroku logs'							# Display recent log output
alias hrlog='heroku logs'							# Display recent log output
# APT ALIAS
alias aptalias='alias | grep apt'					# show all alias for apt
alias update='sudo apt update -y'					# Update list of available packages
alias upgrade='sudo apt upgrade -y'					# Upgrade the system by installing/upgrading packages
alias full-upgrade='sudo apt full-upgrade -y'		# Upgrade the system by removing/installing/upgrading packages
alias dist-upgrade='sudo apt dist-upgrade -y'		# Upgrade your distributtion system with sudo and ask yes
alias autoremove='sudo apt autoremove'				# Remove automatically all unused packages
# RAILS ALIAS
alias railsalias='alias | grep rails'				# Show all alias for rails
### RAILS CREATION
alias rn='rails _5.2.3_ new'						# Create rails app with version 5.2.3 of RAILS
alias rnd='rails _5.2.3_ new --database=postgresql'	# Create rails app with version 5.2.3 of RAILS and postgresql
### RAILS OTHER
alias rc='rails console'
alias rd='rails destroy'
alias rp='rails plugin'
alias ru='rails runner'
alias rs='rails server'
alias rsd='rails server --debugger'
alias rr='rails routes'
### RAILS GENERATE
alias rg='rails generate'
alias rgmigration='rails generate migration'
alias rgmodel='rails generate model'
alias rgscaffold='rails generate scaffold'
alias rgcontroller='rails generate controller'
### RAILS DATABASE
alias rdb='rails dbconsole'							# Database console in the database of your Rails APP
alias rdbd='rails db:drop'
alias rdbc='rails db:create'
alias rdbs='rails db:seed'
alias rdbm='rails db:migrate'
alias rdbms='rails db:migrate status'
alias rdbr='rails db:rollback'
#VISUAL CODE ALIAS
alias vsc='code .'									# Open the current folder in VS code
#OTHERS ALIAS
alias vi='vim'
alias svim='sudo vim'								# Launch Vim with sudo
alias edit='vim'"

	launching_command "echo $ALIAS >> $FILE_ALIAS"
	sleep 2

	echo "$ALIAS" >> $FILE_ALIAS

	detect_text "Here is the content of $FILE_ALIAS"

	press_any_key_to_continue

	cat $FILE_ALIAS

	footer "ALIAS INSTALATION END"

	press_any_key_to_continue
}

menu_whiptail() {
    while [ 1 ]; do

        if hash resize 2>/dev/null; then
            eval $(resize)
            CHOICE=$(whiptail --title "Installfest - The Hacking Project" --menu "By LinkPhoenix" --nocancel --notags --clear $(($LINES - 10)) $(($COLUMNS - 50)) $(($LINES - 20)) \
                "1)" "Exit" \
                "2)" "Depencies installation" \
                "3)" "RVM installation" \
                "4)" "Ruby version 2.5.1 installation" \
                "5)" "Rails version 2.5.3 installation" \
                "6)" "Check Ruby and Rails versions" \
                "7)" "Heroku Installation" \
                "8)" "Gem Installation" \
                "9)" "PG's gem installation" \
                "10)" "Install Oh My ZSH" \
                "11)" "Choice my IDE" \
                "12)" "Install VIM" \
                "13)" "Install GIT" \
                "14)" "Install Visual Code Extensions" \
                "15)" "Install Terminator" \
                "16)" "GIT : Config global setting" \
                "17)" "Checking for existing SSH keys" \
				"18)" "Add Alias > GIT/Bundle/Heroku..." 3>&2 2>&1 1>&3)
        else
            CHOICE=$(whiptail --title "Installfest - The Hacking Project" --menu "By LinkPhoenix" --nocancel --notags --clear 25 78 16 \
                "1)" "Exit" \
                "2)" "Depencies installation" \
                "3)" "RVM installation" \
                "4)" "Ruby version 2.5.1 installation" \
                "5)" "Rails version 2.5.3 installation" \
                "6)" "Check Ruby and Rails versions" \
                "7)" "Heroku Installation" \
                "8)" "Gem Installation" \
                "9)" "PG's gem installation" \
                "10)" "Install Oh My ZSH" \
                "11)" "Choice my IDE" \
                "12)" "Install VIM" \
                "13)" "Install GIT" \
                "14)" "Install Visual Code Extensions" \
                "15)" "Install Terminator" \
                "16)" "GIT : Config global setting" \
                "17)" "Checking for existing SSH keys" \
				"18)" "Add Alias > GIT/Bundle/Heroku..." 3>&2 2>&1 1>&3)
        fi
        case $CHOICE in
        "1)") end_of_script ;;
        "2)") install_dependencies ;;
        "3)") install_RVM ;;
        "4)") install_Ruby ;;
        "5)") install_Rails ;;
        "6)") check_ror_version ;;
        "7)") install_Heroku ;;
        "8)") install_all_gem ;;
        "9)") install_gem_pg ;;
        "10)") install_oh_my_zsh ;;
        "11)") choice_IDE ;;
        "12)") install_vim ;;
        "13)") install_git ;;
        "14)") extension_vscode ;;
        "15)") install_terminator ;;
        "16)") config_git ;;
        "17)") checking_for_existing_ssh_keys ;;
		"18)") add_full_alias ;;
        esac
    done
    exit
}

setup_color

header "UPDATE & UPGRADE"

launching_command "sudo apt update"
sudo apt update
launching_command "sudo apt upgrade"
sudo apt upgrade
launching_command "sudo apt dist-upgrade"
sudo apt dist-upgrade

header "INSTALL ALL DEPENDENCIES"

launching_command "sudo apt install make"
sudo apt install make

launching_command "sudo apt install gcc"
sudo apt install gcc

launching_command "sudo apt install git"
sudo apt install git

launching_command "sudo apt install xclip"
sudo apt install xclip

launching_command "software-properties-common"
sudo apt install software-properties-common

launching_command "fonts-powerline"
sudo apt install fonts-powerline

header "REMOVE UNLESS ELEMENTARY APPS"

launching_command "sudo apt remove epiphany io.elementary.code"
sudo apt remove epiphany-browser io.elementary.code

# ZSH INSTALL
header "OH MY ZSH installation"

if hash zsh 2>/dev/null; then
    detect_text "ZSH has been detected on your system"
else
    warning_text "Zsh has not detected on your system"
    echo "${YELLOW}I will install it with sudo${RESET}"
    launching_command "sudo apt install zsh"
    information "After installing OH MY ZSH you will have to leave" "the SHELL by typing EXIT to continue the script"
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
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
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

##LIBRE OFFICE
header "INSTALL LIBRE OFFICE"

launching_command "sudo add-apt-repository ppa:libreoffice/ppa"
sudo add-apt-repository ppa:libreoffice/ppa
launching_command "sudo apt install libreoffice-writer"
sudo apt install libreoffice-writer
launching_command "sudo apt install libreoffice-calc"
sudo apt install libreoffice-calc

##CALIBRE
header "INSTALL CALIBRE"

launching_command "sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin"
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

##Virtual Box
header "INSTALL VIRTUAL BOX"

launching_command "echo deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib | sudo tee /etc/apt/sources.list.d/virtualbox.list"
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
launching_command "wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
launching_command "wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -"
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
launching_command "sudo apt update"
sudo apt update
launching_command "sudo apt install virtualbox-6.0"
sudo apt install virtualbox-6.0

##TERMINATOR
header "TERMINATOR INSTALL"

launching_command "sudo apt install terminator"
sudo apt install terminator

##Config TERMINATOR
header "TERMINATOR CONFIG"

if [ ! -d "$HOME/.config/terminator" ]; then
    mkdir $HOME/.config/terminator
    echo '  [global_config]' >>$HOME/config/terminator/config
    echo '  borderless = True' >>$HOME/config/terminator/config
    echo '  enabled_plugins = InactivityWatch, LaunchpadCodeURLHandler, APTURLHandler, LaunchpadBugURLHandler' >>$HOME/config/terminator/config
    echo '  title_hide_sizetext = True' >>$HOME/config/terminator/config
    echo '  window_state = fullscreen' >>$HOME/config/terminator/config
    echo '[keybindings]' >>$HOME/config/terminator/config
    echo '[layouts]' >>$HOME/config/terminator/config
    echo '  [[default]]' >>$HOME/config/terminator/config
    echo '    [[[child1]]]' >>$HOME/config/terminator/config
    echo '      parent = window0' >>$HOME/config/terminator/config
    echo '      type = Terminal' >>$HOME/config/terminator/config
    echo '    [[[window0]]]' >>$HOME/config/terminator/config
    echo '      parent = ""' >>$HOME/config/terminator/config
    echo '      type = Window' >>$HOME/config/terminator/config
    echo '[plugins]' >>$HOME/config/terminator/config
    echo '[profiles]' >>$HOME/config/terminator/config
    echo '  [[default]]' >>$HOME/config/terminator/config
    echo '    audible_bell = True' >>$HOME/config/terminator/config
    echo '    background_color = " #2e3436"' >>$HOME/config/terminator/config
    echo '    background_darkness = 0.95' >>$HOME/config/terminator/config
    echo '    background_type = transparent' >>$HOME/config/terminator/config
    echo '    cursor_color = " #aaaaaa"' >>$HOME/config/terminator/config
    echo '    font = Roboto Mono 14' >>$HOME/config/terminator/config
    echo '    login_shell = True' >>$HOME/config/terminator/config
    echo '    show_titlebar = False' >>$HOME/config/terminator/config
    echo '    use_system_font = False' >>$HOME/config/terminator/config
fi

#BLUMAN
header "BLUEMAN INSTALLATION"

launching_command "sudo apt install blueman"
sudo apt install blueman

##SLACK
header "Install Slack Desktop"

launching_command "wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb"
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
launching_command "sudo apt install ./slack-desktop-*.deb"
sudo apt install ./slack-desktop-*.deb

##SPOTIFY
header "Install Spotify"

launching_command "curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - "
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
launching_command "echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list"
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
launching_command "sudo apt update"
sudo apt update
launching_command "sudo apt install spotify-client"
sudo apt install spotify-client

##SPOTIFY ADBLOCK
header "Install Sotify AdBlock"

#https://github.com/abba23/spotify-adblock-linux
launching_command "sudo apt install libcurl4-gnutls-dev"
sudo apt install libcurl4-gnutls-dev
launching_command "git clone https://github.com/abba23/spotify-adblock-linux.git"
git clone https://github.com/abba23/spotify-adblock-linux.git
launching_command "cd spotify-adblock-linux"
cd spotify-adblock-linux
launching_command "make"
make

##FIREFOX
header "Install Firefox"

launching_command "sudo apt install firefox"
sudo apt install firefox

##NEOFETCH
header "Install NeoFetch"

launching_command "sudo apt install neofetch"
sudo apt install neofetch

##TREE
header "Install tree"

launching_command "sudo apt install tree"
sudo apt install tree

##GRUB CUSTOMIZER
header "Install grub-customizer"

launching_command "sudo add-apt-repository ppa:danielrichter2007/grub-customizer"
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
launching_command "sudo apt update"
sudo apt update
launching_command "sudo apt install grub-customizer"
sudo apt install grub-customizer

##GPARTED
header "Install Gparted"

launching_command "sudo apt install gparted"
sudo apt install gparted

##DOLPHIN EMULKATOR
header "DOLPHIN EMULATOR INSTALL"

launching_command "sudo apt-add-repository ppa:dolphin-emu/ppa"
sudo apt-add-repository ppa:dolphin-emu/ppa
launching_command "sudo apt update"
sudo apt update
launching_command "sudo apt install dolphin-emu"
sudo apt install dolphin-emu

##STEAM
header "STEAM INSTALL"

launching_command "sudo apt install steam-installer"
sudo apt install steam-installer

##QBITTORENT
header "Install QBITORRENT"

launching_command "sudo apt install qbittorrent"
sudo apt install qbittorrent

##INSTALL ANDROID FILE TRANSFER
header "INSTALL ANDROID FILE TRANSFER"

launching_command "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0BB4A1B2FA1A38EB"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0BB4A1B2FA1A38EB
launching_command "sudo add-apt-repository deb http://ppa.launchpad.net/samoilov-lex/aftl-stable/ubuntu artful main"
sudo add-apt-repository "deb http://ppa.launchpad.net/samoilov-lex/aftl-stable/ubuntu artful main"
launching_command "sudo apt install android-file-transfer"
sudo apt install android-file-transfer

##KODI
header "INSTALL KODI"

launching_command "sudo apt install software-properties-common"
sudo apt install software-properties-common
launching_command "sudo add-apt-repository ppa:team-xbmc/ppa"
sudo add-apt-repository ppa:team-xbmc/ppa
launching_command "sudo apt update"
sudo apt update
launching_command "sudo apt install kodi"
sudo apt install kodi

#ELEMENTARY TWEAKS
header "Install Elementary-Tweaks"

launching_command "sudo add-apt-repository -y  ppa:philip.scott/elementary-tweaks"
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
launching_command "sudo apt update"
sudo apt update
launching_command "sudo apt install elementary-tweaks"
sudo apt install elementary-tweaks

#DCONF-EDITOR
header "INSTALL DCONF-EDITOR"

launching_command "sudo apt install dconf-editor "
sudo apt install dconf-editor

#CHANGE SHELL TO TERMINATOR
header "change the default terminal by Terminator"

launching_command "gsettings set org.gnome.desktop.default-applications.terminal exec terminator"
gsettings set org.gnome.desktop.default-applications.terminal exec terminator
launching_command "gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''"
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''

# echo "Default value for default terminal"
# gsettings reset org.gnome.desktop.default-applications.terminal exec
# gsettings reset org.gnome.desktop.default-applications.terminal exec-arg

##CONFIG CALANDAR

gsettings set io.elementary.desktop.wingpanel.datetime show-weeks "true"

##Remove WINPANEL Transparency
# gsettings set io.elementary.desktop.wingpanel use-transparency "false"

##SHOW HIDDEN FILES
gsettings set io.elementary.files.preferences show-hiddenfiles "true"

##Double Click Files
gsettings set io.elementary.files.preferences single-click "false"

##Edit Shortcut
####System
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal '<super>t'
gsettings set org.gnome.settings-daemon.plugins.media-keys home '<super>e'
gsettings set org.gnome.settings-daemon.plugins.media-keys www '<super>b'
####Custum
######Visual Code
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'code'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Visual Code'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>c'

##NIGHT LIGHT
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled "true"

##CONFIG CLEANER
gsettings set org.gnome.desktop.privacy remove-old-temp-files "true"
gsettings set org.gnome.desktop.privacy remove-old-trash-files "true"

##GEOLOCALISATION
gsettings set io.elementary.desktop.agent-geoclue2 location-enabled "true"

##GESTURE

gesture_install() {
    header "libinput-gestures"

    information "add actual user in input's group"

    sudo gpasswd -a $USER input

    information "You need restart your PC or logon and login"
    information "Dependancies installation"

    sudo apt install xdotool wmctrl
    sudo apt install libinput-tools

    information "Download the Github"

    git clone https://github.com/bulletmark/libinput-gestures.git
    cd libinput-gestures
    sudo make install
    sleep 5
    cd

    sudo rm -rf libinput-gestures

    libinput-gestures-setup autostart
}

ask gesture_install

##wingpanel-indicator-ayatana
header "Install Wingpanel Indicatior AYATANA"

launching_command "mkdir -p ~/.config/autostart"
mkdir -p ~/.config/autostart
launching_command "cp /etc/xdg/autostart/indicator-application.desktop ~/.config/autostart/"
cp /etc/xdg/autostart/indicator-application.desktop ~/.config/autostart/
launching_command "sed -i 's/^OnlyShowIn.*/OnlyShowIn=Unity;GNOME;Pantheon;/' ~/.config/autostart/indicator-application.desktop"
sed -i 's/^OnlyShowIn.*/OnlyShowIn=Unity;GNOME;Pantheon;/' ~/.config/autostart/indicator-application.desktop
launching_command "wget http://ppa.launchpad.net/elementary-os/stable/ubuntu/pool/main/w/wingpanel-indicator-ayatana/wingpanel-indicator-ayatana_2.0.3+r27+pkg17~ubuntu0.4.1.1_amd64.deb"
wget http://ppa.launchpad.net/elementary-os/stable/ubuntu/pool/main/w/wingpanel-indicator-ayatana/wingpanel-indicator-ayatana_2.0.3+r27+pkg17~ubuntu0.4.1.1_amd64.deb
launching_command "sudo dpkg -i wingpanel-indicator-ayatana_2.0.3+r27+pkg17~ubuntu0.4.1.1_amd64.deb"
sudo dpkg -i wingpanel-indicator-ayatana_2.0.3+r27+pkg17~ubuntu0.4.1.1_amd64.deb

##MAC OS THEME
header "install Mac OS Theme"

#https://github.com/surajmandalcell/elementary-x
launching_command "git clone https://github.com/surajmandalcell/elementary-x.git ~/.themes/elementary-x"
git clone https://github.com/surajmandalcell/elementary-x.git ~/.themes/elementary-x
launching_command "gsettings set org.gnome.desktop.interface gtk-theme elementary-x"
gsettings set org.gnome.desktop.interface gtk-theme "elementary-x"

##CONFIG DARK MODE
header "Config DARK MODE"

#https://askubuntu.com/questions/769417/how-to-change-global-dark-theme-on-and-off-through-terminal
#https://askubuntu.com/questions/20414/find-and-replace-text-within-a-file-using-commands
GTK_CONFIG=~/.config/gtk-3.0/settings.ini
if [ -f "$GTK_CONFIG" ]; then
    echo "$GTK_CONFIG exist"
    launching_command "sed -i s/gtk-application-prefer-dark-theme=0/gtk-application-prefer-dark-theme=1/g ~/.config/gtk-3.0/settings.ini"
    sed -i 's/gtk-application-prefer-dark-theme=0/gtk-application-prefer-dark-theme=1/g' ~/.config/gtk-3.0/settings.ini
else
    launching_command "touch ~/.config/gtk-3.0/settings.ini"
    touch ~/.config/gtk-3.0/settings.ini
    launching_command "echo [Settings] >> ~/.config/gtk-3.0/settings.ini"
    echo [Settings] >>~/.config/gtk-3.0/settings.ini
    launching_command "echo gtk-application-prefer-dark-theme=1 >> ~/.config/gtk-3.0/settings.ini"
    echo gtk-application-prefer-dark-theme=1 >>~/.config/gtk-3.0/settings.ini
fi

##ICON MAC
header "Install icon theme Mac os La Sierra"

launching_command "https://github.com/btd1337/La-Sierra-Icon-Theme"
https://github.com/btd1337/La-Sierra-Icon-Theme
launching_command "git clone https://github.com/btd1337/La-Sierra-Icon-Theme ~/.icons/La-Sierra"
git clone https://github.com/btd1337/La-Sierra-Icon-Theme ~/.icons/La-Sierra
launching_command "gsettings set org.gnome.desktop.interface icon-theme La-Sierra"
gsettings set org.gnome.desktop.interface icon-theme "La-Sierra"

##TRASH ICON TO DOCK
header "Add trash icone in the dock"

#https://elementaryos.stackexchange.com/questions/18404/where-is-the-trash-icon/21088#21088
launching_command "touch \$HOME/.config/plank/dock1/launchers/trash.dockitem"
touch $HOME/.config/plank/dock1/launchers/trash.dockitem
launching_command "sed -i 's%Launcher=%Launcher=docklet://trash%g' \$HOME/.config/plank/dock1/launchers/trash.dockitem"
sleep 5
sed -i 's%Launcher=%Launcher=docklet://trash%g' $HOME/.config/plank/dock1/launchers/trash.dockitem
sleep 5
launching_command "killall plank"
killall plank

##DOWNLOAD TO DOCK
header "Add download icone to plank"

launching_command "touch \$HOME/.config/plank/dock1/launchers/Downloads.dockitem"
touch $HOME/.config/plank/dock1/launchers/Downloads.dockitem
launching_command "sed -i s%Launcher=%Launcher=//\$HOME/Downloads%g \$HOME/.config/plank/dock1/launchers/Downloads.dockitem"
sleep 5
sed -i "s%Launcher=%Launcher=//$HOME/Downloads%g" $HOME/.config/plank/dock1/launchers/Downloads.dockitem
sleep 5
launching_command "killall plank"
killall plank

##PLANK ICONE
header "Add plank icone in the launcher"

#https://unix.stackexchange.com/questions/382946/getting-permission-denied-when-trying-to-append-text-onto-a-file-using-sudo
launching_command "sudo touch /usr/share/applications/plank-preferences.desktop"
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

launching_command "sudo touch /usr/share/applications/spotify-adblock.desktop"
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
header "CLEAN"

launching_command "sudo apt autoremove"
sudo apt autoremove
