#!/usr/bin/env bash

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

ask_install_gem() {
    set -- $(locale LC_MESSAGES)
    yesptrn="$1"; noptrn="$2"; yesword="$3"; noword="$4"
    while true; do

        echo ""
        read -p "${YELLOW} Install the Gem "$gem" ? [${yesword}/${noword}]? ${RESET}" yn
        case $yn in
            ${yesptrn##^} ) gem install "$gem"; break;;
            ${yesword##^} ) gem install "$gem"; break;;
            ${noptrn##^} ) break;;
            ${noword##^} ) break;;
            * ) echo "Answer ${yesword} / ${noword}.";;
        esac
    done
}

do_you_want_continue() {
    read -n 1 -s -r -p "${GREEN} Press any key to continue ${RESET}"
}

setup_color

echo "${GREEN}
  _______ _            _    _            _    _               _____           _           _   
 |__   __| |          | |  | |          | |  (_)             |  __ \         (_)         | |  
    | |  | |__   ___  | |__| | __ _  ___| | ___ _ __   __ _  | |__) | __ ___  _  ___  ___| |_ 
    | |  | '_ \ / _ \ |  __  |/ _' |/ __| |/ / | '_ \ / _' | |  ___/ '__/ _ \| |/ _ \/ __| __|
    | |  | | | |  __/ | |  | | (_| | (__|   <| | | | | (_| | | |   | | | (_) | |  __/ (__| |_ 
    |_|  |_| |_|\___| |_|  |_|\__,_|\___|_|\_\_|_| |_|\__, | |_|   |_|  \___/| |\___|\___|\__|
                                                       __/ |                _/ |              
                                                      |___/                |__/               
  _____       _       _ _           __ _                                                      
 |_   _|     | |     | (_)         / _| |                                                     
   | |  _ __ | |_ ___| |_ ___  ___| |_| |_                                                    
   | | | '_ \| __/ _ \ | / __|/ _ \  _| __|                                                   
  _| |_| | | | ||  __/ | \__ \  __/ | | |_                                                    
 |_____|_| |_|\__\___|_|_|___/\___|_|  \__|                                                   
                                             ${RESET}" 

echo "I'm going to install all the dependencies for Ruby and RVM"
do_you_want_continue

sudo apt-get install autoconf automake bison build-essential curl git-core libapr1 libaprutil1 libc6-dev libltdl-dev libsqlite3-0 libsqlite3-dev libssl-dev libtool libxml2-dev libxslt-dev libxslt1-dev libyaml-dev ncurses-dev nodejs openssl sqlite3 zlib1g zlib1g-dev libreadline7

echo "I'm going to install RVM"
do_you_want_continue

sudo apt install gnupg
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -L get.rvm.io | bash -s stable

echo "I'm going to install Ruby in version 2.5.1 with RVM"
do_you_want_continue

sudo apt-get install automake
rvm install 2.5.1
rvm use 2.5.1
rvm --default use 2.5.1

echo "I'm going to install Rails 5.2.3 with GEM"
do_you_want_continue

gem install rails -v 5.2.3

echo "I'm goiing to Install Heroku"
do_you_want_continue
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

gem_installation() {
    echo "#######################################################"
    echo ""
    echo "Gem Installation"
    echo ""
    echo "#######################################################"
    gem_array=(rspec rubocop pry dotenv twitter nokogiri launchy watir selenium-webdriver json colorize sinatra shotgun csv rack sqlite3 faker)

    for gem in "${gem_array[@]}"; do ask_install_gem; done
}

gem_installation

pg_installation() {
    if [[ -r /etc/os-release ]]; then
    . /etc/os-release
        if [[ $ID = ubuntu ]]; then
            read _ UBUNTU_VERSION_NAME <<< "$VERSION"
            echo "Running Ubuntu $UBUNTU_VERSION_NAME"
            sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ $UBUNTU_VERION_NAME-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
            echo "I add 'deb http://apt.postgresql.org/pub/repos/apt/ $UBUNTU_VERSION_NAME-pgdg main' in /etc/apt/sources.list.d/pgdg.list"
        else
            echo "Not running an Ubuntu distribution. ID=$ID, VERSION=$VERSION"
            sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ $UBUNTU_CODENAME-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
            echo "I add 'deb http://apt.postgresql.org/pub/repos/apt/ $UBUNTU_CODENAME-pgdg main' in /etc/apt/sources.list.d/pgdg.list"
        fi
    else
        echo "Not running a distribution with /etc/os-release available"
    fi
    wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
    sudo apt update
    sudo apt upgrade
    sudo apt install postgresql-common
    sudo apt install postgresql-9.5 libpq-dev
}

pg_installation

