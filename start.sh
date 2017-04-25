mv ~/.vimrc ~/.vimrc.pre-dotfiles
mv ~/.zshrc ~/.zshrc.pre-dotfiles

ln -sf `pwd`/.vimrc ~/.vimrc
ln -sf `pwd`/.zshrc ~/.zshrc
