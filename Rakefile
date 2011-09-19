include FileUtils

BASE_PATH = File.dirname(__FILE__)
BUNDLE_PATH = File.join(BASE_PATH, 'bundle')

desc "Installs Vim, Vam, Voom"
task :install do
  system "git submodule update --init"
  rm_rf File.join(BUNDLE_PATH, 'snipmate', 'snippets')
  system "ln -s #{BASE_PATH} ~/.vim" # Set vigor as vim
  system "ln -s ~/.vim/vimrc ~/.vimrc"
  system "ln -s ~/.vim/gvimrc ~/.gvimrc"
  command_t
end

desc "Updates from origin and syncs submodules"
task :update do
  system "git pull"
  system "git submodule sync"
  system "git submodule update --init --recursive"
  rm_rf File.join(BUNDLE_PATH, 'snipmate', 'snippets')
  command_t
end

# Compile command-t
def command_t
  cd(File.join(BUNDLE_PATH, 'command-t')) do
    system "rake make"
  end
end

