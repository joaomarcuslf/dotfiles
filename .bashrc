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
