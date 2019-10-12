=begin
 ##############################################################
 # Author      : LinkPhoenix                                  #
 # Date        : 12 October 2019                              #
 # Note        : code during training The Hacking Project 2019#
 ##############################################################
 
 LEGEND
  \n = NEW LINE
  \t = TABLULATION
  STDIN = Get the input from the console
=end

# Check if input?, if false print How to use app
def check_if_user_gave_input
  abort("MkDirRuby :: Missing input\n\tI need least one argument for create your Ruby folder\n\tExemple :: >mkdiruby my new project\n\n\tNOTE :: I would replace spaces with '_'") if ARGV.empty?
end

# Press enter if you want continue function
# comment if you don't want to controls step
def press_enter_for_continue
  puts "Press ENTER to continue..."
  name = STDIN.gets
  if name == "\n"
    return
  else
    puts "You need press ENTER to continue"
    press_enter_for_continue
  end
end

# Check if the folder already exist
def directory_exists?(folder_name)
  if File.directory?(folder_name)
    abort("#{folder_name} folder already exist")
  end
end

# Create the folder project directory
def create_folder_project(folder_name)
  working_directory = Dir.pwd
  Dir.mkdir(folder_name)
  puts "Step 1"
  puts "I create #{folder_name} in #{working_directory}"
  puts ""
end

# Function for change directory
def change_directory(folder_name)
  return Dir.chdir(folder_name)
end

# Create the Gemfile and write in each ruby version and gems require
def create_gemfile
  puts "Step 2"
  puts "I create the Gemfile in #{Dir.pwd}"
  puts ""
  File.open("Gemfile", "w") { |i|
    i << "source 'https://rubygems.org'\n"
    i << "ruby '2.5.1'\n"
    i << "gem 'rspec'\n"
    i << "gem 'pry'\n"
    i << "gem 'rubocop', '~> 0.57.2'\n"
    i << "gem 'nokogiri'\n"
    i << "gem 'dotenv\n"
  }
end

# Git Init :: Create the .git folder
def git_init
  system("git init > /dev/null")
  if $? == 0
    puts "Step 3"
    puts "Launch command :: 'git init' in #{Dir.pwd}"
    puts ""
  else
    puts "Step 3 !!!!FAILED!!!"
    puts "The command :: 'git init' Failed"
  end
end

def create_env
  puts "Step 4"
  puts "I create the .env file in #{Dir.pwd}"
  puts ""
  File.open(".env", "w")
  File.open(".gitignore", "w"){ |i|
    i << "# OS generated files #\n"
    i << "######################\n"
    i << "\n"
    i << ".DS_Store\n"
    i << "_*\n"
    i << ":Trashes\n"
    i << "\n"
    i << "# Others #\n"
    i << "##########\n"
    i << "\n"
    i << ".env\n"
  }
end

# Function for create the "lib" folder
def create_lib_folder
  puts "Step 5"
  puts "I create the 'lib' folder in #{Dir.pwd}"
  puts ""
  Dir.mkdir("lib")
end

# Rspec Init :: Create Spec folder and ".spec" file
def rspec_init
  system('rspec --init > /dev/null')
  if $? == 0
    puts "Step 6"
    puts "Launch command :: 'rspec --init' in #{Dir.pwd}"
    puts ""
  else
    puts "Step 6 !!!FAILED!!!"
    puts "The command :: 'respec --init' Failed"
    puts ""
  end
end

# Create the README and Write in
def create_README_md
  puts "Step 7"
  puts "I create the README in #{Dir.pwd}"
  puts ""
  File.open("README.md", "w"){ |i|
    i << "# #{ARGV.join(" ")}\n"
    i << "\n"
    i << "New project in ruby\n"
  }
end

# Create the Rubocopy and write in
def create_rubocop
  puts "step 8"
  puts "I create the Rubocop.yml in #{Dir.pwd}"
  puts ""
  File.open(".rubocop.yml", "w"){ |i|
    i << "inherit_from:\n"
    i << "  - http://relaxed.ruby.style/rubocop.yml\n"
    i << "\n"
    i << "AllCops:\n"
    i << " DisplayStyleGuide: true\n"
    i << " DisplayCopNames: true\n"
    i << " Exclude:\n"
    i << "  - 'db/schema.rb'\n"
    i << "  - 'vendor/**/*'\n"
    i << "  - 'config/environments/*.rb'\n"
    i << "  - 'bin/*'\n"
    i << "\n"
    i << "Rails:\n"
    i << " Enabled: True\n"
    i << "\n"
    i << "Metrics/BlockLength:\n"
    i << " Exclude:\n"
    i << "  - 'spec/**/*.rb'\n"
    i << "  - 'Guardfile'\n"
    i << "  - 'vendor/bundle'\n"
  }
  end

  def perform
    # Create var with ARGV and convert in string
    # Because "File.directory?" can test only string and not array
    # If ARGV has only one argument there is no addition of "_"
    folder_name = ARGV.join("_").to_s
    check_if_user_gave_input
    directory_exists?(folder_name)
    create_folder_project(folder_name)
    press_enter_for_continue
    change_directory(folder_name)
    create_gemfile
    press_enter_for_continue
    git_init
    press_enter_for_continue
    create_env
    press_enter_for_continue
    create_lib_folder
    press_enter_for_continue
    rspec_init
    press_enter_for_continue
    create_README_md
    press_enter_for_continue
    create_rubocop
    puts "Your new project #{folder_name} is create"
    puts "in #{Dir.pwd}"
  end

  perform
