echo "create Gemfile"

touch Gemfile

echo "Initial Bundle"

bundle install

echo "Initial Rspec"

rspec --init

echo "create folder lib"

mkdir lib
