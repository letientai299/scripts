#!/bin/sh

function task() {
  echo
  echo
  echo "========================================"
  echo "$*"
  echo "========================================"
}

task "Build essential"
sudo apt-get install -y build-essential

task "Grub Customizer"
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
sudo apt-get update
sudo apt-get install grub-customizer -y

task "Git"
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y

task "Numix color theme"
sudo add-apt-repository ppa:numix/ppa -y
sudo apt-get update
sudo apt-get install -y numix-gtk-theme numix-icon-theme-circle
sudo apt-get install -y unity-tweak-tool
sudo apt-get install -y gnome-tweak-tool

task "Neovim"
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update
sudo apt-get install neovim -y

task "Xclip (for neovim clipboard)"
sudo apt-get install xclip -y

task "Python and neovim binding"
sudo apt-get install python python3 python-dev python3-dev python-pip python3-pip -y
pip install --upgrade pip
pip install --user neovim
pip3 install --upgrade pip
pip3 install --user neovim

task "Ruby and neovim binding"
sudo apt-get install ruby-dev ruby -y
sudo gem install neovim

task "Tmux"
sudo apt-get install tmux -y
pip3 install --user powerline-status

task "Ranger"
sudo apt-get install -y ranger w3m w3m-img highlight
ranger --copy-config=all

task 'Zathura'
sudo apt-get install -y zathura

task "Fix Androdi SDK installation issue (mksdcard)"
sudo apt-get install lib32z1 lib32ncurses5 lib32stdc++6 -y

task "ag search"
sudo apt-get install silversearcher-ag -y

task "curl and wget"
sudo apt-get install -y curl wget

task "zsh"
sudo apt-get install -y zsh
chsh  -s "$(which zsh)"

task "Nodejs"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

task "Fix NPM permissions"
mkdir ~/.npm-global
npm config set prefix "$HOME/.npm-global"
echo '# Fix npm permissions' >> $HOME/.profile
echo 'export PATH=$PATH:$HOME/.npm-global/bin' >> $HOME/.profile

task "Install some favorite tools"
npm install -g nodemon diff-so-fancy fkill-cli

task "Update path to load nodejs binaries"
echo 'export PATH="$PATH:$HOME/.npm-global/bin"' >> ~/.profile
task "yarn"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y

task "sdkman"
curl -s "https://get.sdkman.io" | bash

task "VLC and mpv"
sudo apt-get install -y vlc mpv

task "Xterm 256 italic"
cd $HOME
mkdir temp
cd temp
wget "https://gist.github.com/sos4nt/3187620/raw/bca247b4f86da6be4f60a69b9b380a11de804d1e/xterm-256color-italic.terminfo"
tic xterm-256color-italic.terminfo
