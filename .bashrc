if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.bash_exports ]; then
. ~/.bash_exports
fi

if [ -f ~/.bash_locals ]; then
. ~/.bash_locals
fi

# added by Anaconda3 installer
export PATH="/home/joaomarcuslf/anaconda3/bin:$PATH"
