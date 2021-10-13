source ~/.bashrc
source ~/.bash_locals

$LAST_PATH = `pwd`

cd ~/dotfiles
if [[ `git status --porcelain` ]]; then
  echo "Updating dotfiles Repo"

  git pull

  refresh
  cd $LAST_PATH
else
  cd $LAST_PATH
fi

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
# ZSH_THEME="frontcube"

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
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joaolemos/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/joaolemos/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joaolemos/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/joaolemos/google-cloud-sdk/completion.zsh.inc'; fi
