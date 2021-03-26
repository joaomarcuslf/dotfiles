#!/bin/bash

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

# Node and Ruby
question "NVM and Node"
if [ $answer == 1 ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
  nvm install --lts
fi

question "RVM and Ruby"
if [ $answer == 1 ]; then
  curl -sSL https://get.rvm.io | bash -s stable --ruby --gems=rails,puma
fi

# Lein for Clojure
question "Lein for Clojure"
if [ $answer == 1 ]; then
  curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein >lein
  sudo mv lein /usr/local/bin/lein
  sudo chmod a+x /usr/local/bin/lein
fi

# Zsh
export RUNZSH=no

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -sf $(pwd)/zsh-themes/joaomarcuslf.zsh-theme ~/.oh-my-zsh/themes/joaomarcuslf.zsh-theme

cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins && git clone https://github.com/djui/alias-tips.git
cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions

cd ~

mv ~/.vimrc ~/.vimrc.pre-dotfiles
mv ~/.zshrc ~/.zshrc.pre-dotfiles
mv ~/.bash_aliases ~/.bash_aliases.pre-dotfiles
mv ~/.bash_exports ~/.bash_exports.pre-dotfiles
mv ~/.bashrc ~/.bashrc.pre-dotfiles

ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.bash_aliases ~/.bash_aliases
ln -sf $(pwd)/.bash_exports ~/.bash_exports
ln -sf $(pwd)/.bashrc ~/.bashrc
