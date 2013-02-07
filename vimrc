" Andreas Røssland <andreas.roessland@gmail.com> "
""""""""""""""""""""""""""""""""""""""""""""""""""
" git clone git://github.com/andross/vim.git     "


" Enable cool Vim-only settings
set nocompatible 

" Enable syntax highlighting
syntax on 

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
	set guifont=Liberation\ Mono\ 9
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
