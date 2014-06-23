" Andreas Røssland <andreas.roessland@gmail.com> "
""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable cool Vim-only settings
set nocompatible 

" Enable 16 colors
set t_Co=16

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
"colorscheme molokai

" If Gvim is running
if has("gui_running")

    " My favourite theme
    colorscheme molokai

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

" Add better keys for tab navigation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab> <Esc>:tabprevious<CR>i
inoremap <C-t> <Esc>:tabnew<CR>

" Enable folder-specific vimrc
set exrc
set secure

" localvimrc, enable remembering which .lvimrc files are accepted
let g:localvimrc_persistent=2
