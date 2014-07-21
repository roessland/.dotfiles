" Andreas Røssland <andreas.roessland@gmail.com> "
""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable cool Vim-only settings
set nocompatible 
filetype off " required for Vundle

" Enable vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'bling/vim-airline'
call vundle#end()
filetype plugin indent on

" CtrlP ignore folders
let g:ctrlp_custom_ignore = '\v[\/](bower_components|node_modules|target|dist)|(\.(swp|ico|git|svn))$'
" CtrlP set root dir to .git (because of autochdir screws this up)
let g:ctrlp_working_path_mode = 'ra'

" Enable 256 colors
set t_Co=256

" Enable syntax highlighting
syntax on 

" Show cursor position
set ruler

" Encoding
set enc=utf-8 

" 4 spaces as indent size
set shiftwidth=4 

" Tabs count as 4 spaces
set softtabstop=4 

" Turn on line numbering
set number 

" Tells vim tabs are four spaces wide
set tabstop=4 

" Expand tabs into spaces when typing them
set expandtab

" Scroll up/down when within 5 lines of top/bottom
set scrolloff=5
 
" My favourite theme
colorscheme molokai

" If Gvim is running
if has("gui_running")

    " Remove toolbar
    set guioptions-=T

    " Faster updates
    set ttyfast

" If linux GUI
if has("gui_gtk2")

    " Linux font
	set guifont=Liberation\ Mono\ 11
endif

" If Windows GUI
elseif has("gui_win32")

    " Windows font
	set guifont=Consolas:h11
end

"make background dark grey, not black
"highlight Normal ctermbg=236 guibg=#202020 

" Incremental search
set incsearch

" Highlight on search highlights current matches while typing
set hls 

" Show matching brace
if has("gui_running")
    set showmatch " This option obscures view with my colorscheme
endif

" Instant search searches without pressing enter 
set is 

" Increase command line history
set history=100 

" Increase undo history
set undolevels=1000

" Display incomplete commands in corner
set showcmd 

" We have a

" Enable mouse in terminal emulator
if has('mouse')
    set mouse=a 
endif

" Switch directory to current file on bufferchange
set autochdir 

" Automatically indents on newline after {
set autoindent

"Allow backspace over indentation, newline and start point of insert mode
set backspace=indent,eol,start 

" Better tab completion
set wildmenu
set wildmode=list:longest,full

" Add Go syntax and plugins
set rtp+=$GOROOT/misc/vim
filetype off
filetype plugin indent on

" Add Chrome/Firefox keys for tab navigation
" Usually only works in Linux, not PuTTY or Terminal
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab> <Esc>:tabprevious<CR>i
inoremap <C-t> <Esc>:tabnew<CR>

" Add tmux keys for window splitting
nnoremap <C-w>" :sp<CR>
nnoremap <C-w>% :vsp<CR>

" change leader key
let mapleader = ","
map <Space> <Leader>

" Add Leader hl for tab navigation (OSX doesn't like the Chrome keys)
nmap <Leader>l :tabnext<CR>
nmap <Leader>h :tabprevious<CR>
nmap <Leader>c :tabnew<CR>
nmap <Leader>x :tabclose<CR>



" Enable folder-specific vimrc
set exrc
set secure

" localvimrc, enable remembering which .lvimrc files are accepted
let g:localvimrc_persistent=2
