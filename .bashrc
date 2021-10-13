if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_exports ]; then
    . ~/.bash_exports
fi

if [ -f ~/.bash_locals ]; then
    . ~/.bash_locals
fi

# if xsetwacom --list devices | grep -q 'Wacom Intuos S'; then
# . ~/dotfiles/wacom
# fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joaolemos/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/joaolemos/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joaolemos/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/joaolemos/google-cloud-sdk/completion.zsh.inc'; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"