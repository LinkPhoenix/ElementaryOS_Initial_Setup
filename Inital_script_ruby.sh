echo "create Gemfile"

touch Gemfile

echo "Edit the Gemile"

echo "ruby '2.5.1'" >> Gemfile
echo "em 'rspec'"  >> Gemfile
echo "gem 'pry'" >> Gemfile
echo "gem 'rubocop', '~> 0.57.2'" >> Gemfile
echo "gem 'rubygems'" >> Gemfile
echo "gem 'nokogiri'" >> Gemfile

echo "Install Gem (create the Gemfile.lock)"

echo "Initial Bundle"

bundle install

echo "Initial Rspec"

rspec --init

echo "create folder lib"

mkdir lib
