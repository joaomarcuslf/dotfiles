. ~/.bashrc

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bash_exports ]; then
  . ~/.bash_exports
fi

if [ -f ~/.bash_locals ]; then
  . ~/.bash_locals
fi

ENABLE_LOAD_NVM=1
ENABLE_LS_ON_ENTER=1

LAST_PATH=$(pwd)

ENABLE_LS_ON_ENTER=0
cd ~/dotfiles
git fetch
HEADHASH=$(git rev-parse HEAD)
UPSTREAMHASH=$(git rev-parse master@{upstream})

if [ "$HEADHASH" != "$UPSTREAMHASH" ]; then
  echo "Updating dotfiles, pulling from remote"

  git pull

  cd $LAST_PATH

  refresh
else
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

plugins=(git git-extras zsh-autosuggestions alias-tips rvm python pip)

source $ZSH/oh-my-zsh.sh

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/joaolemos/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/Users/joaolemos/opt/anaconda3/etc/profile.d/conda.sh" ]; then
    . "/Users/joaolemos/opt/anaconda3/etc/profile.d/conda.sh"
  else
    export PATH="/Users/joaolemos/opt/anaconda3/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
