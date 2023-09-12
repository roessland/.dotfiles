# This script is designed to be idempotent, thus
# running it multiple times is safe.

# Same for every machine
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/nvim ~/.config/
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/ideavimrc ~/.ideavimrc
mkdir -p ~/.config/fd/
ln -s ~/.dotfiles/ignore ~/.config/fd/ignore # for fd
ln -s ~/.dotfiles/ignore ~/.ignore # for fd, rg, ag
ln -s ~/.dotfiles/ignore ~/.fdignore # for fd
#ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
git clone http://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Error from Vundle can be ignored"
vim +BundleInstall +qall

touch ~/.gitconfig
LINE="[include]\n\tpath = .dotfiles/gitconfig"
if ! rg -q --multiline '\[include\]\n\s+path = \.dotfiles/gitconfig' ~/.gitconfig ; then echo $LINE >> ~/.gitconfig ; fi

LINE="source ~/.dotfiles/zshrc_include"
if ! grep -q "$LINE" ~/.zshrc ; then echo $LINE >> ~/.zshrc ; fi

exec zsh
