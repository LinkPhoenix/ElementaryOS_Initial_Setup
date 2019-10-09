echo "Install dependencies"

sudo apt-get install autoconf automake bison build-essential curl git-core libapr1 libaprutil1 libc6-dev libltdl-dev libsqlite3-0 libsqlite3-dev libssl-dev libtool libxml2-dev libxslt-dev libxslt1-dev libyaml-dev ncurses-dev nodejs openssl sqlite3 zlib1g zlib1g-dev libreadline7

echo "install RVM"

sudo apt install gnupg
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -L get.rvm.io | bash -s stable

echo "Install Ruby 2.5.1 with RVM"

sudo apt-get install automake
rvm install 2.5.1
rvm use 2.5.1
rvm --default use 2.5.1

echo "Install Rails 5.2.3 with GEM"

gem install rails -v 5.2.3

echo "Install Heroku"

curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

echo "Installation all GEM"

echo "1: Rspec"

gem install rspec

echo "2: Ruboscop"

gem install rubocop

echo "3: Pry"

gem install pry
