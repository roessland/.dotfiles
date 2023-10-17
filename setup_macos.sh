# This script is designed to be idempotent, thus
# running it multiple times is safe.

# Same for every machine
ln -sn ~/.dotfiles/vimrc ~/.vimrc
ln -sn ~/.dotfiles/vim ~/.vim
ln -sn ~/.dotfiles/nvim ~/.config/
ln -sn ~/.dotfiles/gitconfig ~/.gitconfig
ln -sn ~/.dotfiles/ideavimrc ~/.ideavimrc
mkdir -p ~/.config/fd/
ln -sn ~/.dotfiles/ignore ~/.config/fd/ignore # for fd
ln -sn ~/.dotfiles/ignore ~/.ignore # for fd, rg, ag
ln -sn ~/.dotfiles/ignore ~/.fdignore # for fd
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
