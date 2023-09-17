# This script is designed to be idempotent, thus
# running it multiple times is safe.

# Same for every machine
ln -sn $HOME/.dotfiles/vimrc $HOME/.vimrc
ln -sn $HOME/.dotfiles/vim/ $HOME/.vim
ln -sn $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -sn $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -sn $HOME/.dotfiles/taskrc $HOME/.taskrc
git clone http://github.com/gmarik/Vundle.vim.git $HOME/vim/bundle/Vundle.vim
vim +BundleInstall +qall
echo "Fatal Vundle error can be ignored :)"

# Included, since parts of these files may be custom for each machine
touch ~/.bashrc

LINE="source ~/.dotfiles/bashrc_include.sh"
if ! grep -q "$LINE" ~/.bashrc ; then echo $LINE >> ~/.bashrc ; fi

LINE="source ~/.dotfiles/bash_prompt.sh"
if ! grep -q "$LINE" ~/.bashrc ; then echo $LINE >> ~/.bashrc ; fi

LINE="source ~/.dotfiles/alias.sh"
if ! grep -q "$LINE" ~/.bashrc ; then echo $LINE >> ~/.bashrc ; fi

# Reload bash with new settings
exec bash
