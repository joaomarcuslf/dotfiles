#!/bin/bash

echo "Saving old dotfiles with .pre-dotfiles suffix"
[ ! -f ~/.vimrc ] || mv ~/.vimrc ~/.vimrc.pre-dotfiles
[ ! -f ~/.zshrc ] || mv ~/.zshrc ~/.zshrc.pre-dotfiles
[ ! -f ~/.bash_aliases ] || mv ~/.bash_aliases ~/.bash_aliases.pre-dotfiles
[ ! -f ~/.bash_exports ] || mv ~/.bash_exports ~/.bash_exports.pre-dotfiles
[ ! -f ~/.bashrc ] || mv ~/.bashrc ~/.bashrc.pre-dotfiles
[ ! -f ~/.hyper.js ] || mv ~/.hyper.js ~/.hyper.js.pre-dotfiles

# Functions
answer=0

question() {
  while true; do
    echo " "
    read -p "Do you wish to install $1? (y/n) " yn
    case $yn in
    [Yy]*)
      answer=1
      break
      ;;
    [Nn]*)
      answer=0
      break
      ;;
    *) echo "Please answer yes or no." ;;
    esac
  done
}

# Zsh
export RUNZSH=no

dotfiles=`pwd`

echo "Starting: Install Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Copying the default theme to the custom theme directory"
ln -sf $(pwd)/zsh-themes/joaomarcuslf.zsh-theme ~/.oh-my-zsh/themes/joaomarcuslf.zsh-theme

echo "Installing alias-tips"
cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/djui/alias-tips.git

echo "Installing zsh-autosuggestions"
cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions

cd ~

echo "Setting new dotfiles from the repository"
ln -sf $dotfiles/.vimrc ~/.vimrc
ln -sf $dotfiles/.zshrc ~/.zshrc
ln -sf $dotfiles/.bash_aliases ~/.bash_aliases
ln -sf $dotfiles/.bash_exports ~/.bash_exports
ln -sf $dotfiles/.bashrc ~/.bashrc
ln -sf $dotfiles/.hyper.js ~/.hyper.js

touch ~/.bash_locals

question "NVM and Node"
if [ $answer == 1 ]; then
  echo "Installing NVM"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
  nvm install --lts
fi

question "RVM and Ruby"
if [ $answer == 1 ]; then
  echo "Installing RVM"
  curl -sSL https://get.rvm.io | bash -s stable --ruby
  sudo usermod -a -G rvm `whoami`
  rvm --default use ruby
  gem install bundler
fi

question "Conda and Python"
if [ $answer == 1 ]; then
  echo "Installing Conda"
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
  bash ~/miniconda.sh -b -p $HOME/miniconda
  conda init
fi

zsh