source ~/.bashrc
source ~/.bash_locals

ENABLE_LOAD_NVM=1
ENABLE_LS_ON_ENTER=1

LAST_PATH=`pwd`

ENABLE_LS_ON_ENTER=0
cd ~/dotfiles
git fetch
HEADHASH=$(git rev-parse HEAD)
UPSTREAMHASH=$(git rev-parse master@{upstream})

if [ "$HEADHASH" != "$UPSTREAMHASH" ]; then
  echo "Updating dotfiles Repo"

  git pull

  refresh
  cd $LAST_PATH
  ENABLE_LS_ON_ENTER=1
else
  echo "No changes on repo"
  cd $LAST_PATH
  ENABLE_LS_ON_ENTER=1
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=~/.oh-my-zsh

autoload -U add-zsh-hook

load-nvmrc() {
  if [ "$ENABLE_LOAD_NVM" -gt 0 ]; then
    if [[ -f .nvmrc && -r .nvmrc ]]; then
      nvm use
    fi
  fi
}

run-ls() {
  if [ "$ENABLE_LS_ON_ENTER" -gt 0 ]; then
    ls -la
  fi
}

load-setup() {
  if [[ -f ../../setup.sh && -r ../../setup.sh ]]; then
    sh ../../setup.sh
  fi

  if [[ -f ../setup.sh && -r ../setup.sh ]]; then
    sh ../setup.sh
  fi

  if [[ -f setup.sh && -r setup.sh ]]; then
    sh setup.sh
  fi
}

add-zsh-hook chpwd load-nvmrc
add-zsh-hook chpwd run-ls
add-zsh-hook chpwd load-setup

ENABLE_CORRECTION="true"

ZSH_THEME="joaomarcuslf"
# ZSH_THEME="frontcube"

plugins=(git git-extras zsh-autosuggestions alias-tips rvm python pip)

source $ZSH/oh-my-zsh.sh

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$PATH:$HOME/bin"
fi
