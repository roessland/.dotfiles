# This script is designed to be idempotent, thus
# running it multiple times is safe.

# Same for every machine
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
git clone http://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall

# Included, since parts of these files may be custom for each machine
touch ~/.bashrc

LINE="source ~/.dotfiles/bashrc_include.sh"
if ! grep -q "$LINE" ~/.bashrc ; then echo $LINE >> ~/.bashrc ; fi

LINE="source ~/.dotfiles/bash_prompt.sh"
if ! grep -q "$LINE" ~/.bashrc ; then echo $LINE >> ~/.bashrc ; fi

LINE="source ~/.dotfiles/alias.sh"
if ! grep -q "$LINE" ~/.bashrc ; then echo $LINE >> ~/.bashrc ; fi
