source ~/.bashrc
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=~/.oh-my-zsh

autoload -U add-zsh-hook

load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}

run-ls() {
  ls -la
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

ZSH_THEME="joaomarcuslf"

ENABLE_CORRECTION="true"

plugins=(git git-extras zsh-autosuggestions alias-tips rvm python pip)

source $ZSH/oh-my-zsh.sh

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$PATH:$HOME/bin"
fi

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
