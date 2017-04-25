mv ~/.vimrc ~/.vimrc.pre-dotfiles
mv ~/.zshrc ~/.zshrc.pre-dotfiles
mv ~/.bash_aliases ~/.bash_aliases.pre-dotfiles
mv ~/.bash_exports ~/.bash_exports.pre-dotfiles
mv ~/.bashrc ~/.bashrc.pre-dotfiles

ln -sf `pwd`/.vimrc ~/.vimrc
ln -sf `pwd`/.zshrc ~/.zshrc
ln -sf `pwd`/.bash_aliases ~/.bash_aliases
ln -sf `pwd`/.bash_exports ~/.bash_exports
ln -sf `pwd`/.bashrc ~/.bashrc
