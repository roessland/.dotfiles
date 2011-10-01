" Andreas Røssland <andreas.roessland@gmail.com> "
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " Use Vim settings, not Vi settings. This must be first.
" Syntax options
syntax on " Enable syntax highlighting
set enc=utf-8 " Encoding
set shiftwidth=4 " 4 spaces as indent size
set softtabstop=4 " Some weird tab thing
set noexpandtab " We want tabs to be tabs, not spaces
set number " Turn on line numbering
set tabstop=4 " Tells vim tabs are four spaces wide
set expandtab " Expand tabs into spaces
" Visual options
colorscheme desert256 " My favourite theme

" Fonts
if has("gui_gtk2")
	set guifont=Liberation\ Mono\ 9
elseif has("gui_win32")
	set guifont=Consolas:h11
else
	set guifont=Consolas
end

highlight Normal ctermbg=236 guibg=#202020 "make background dark grey, not black
" Search options
set hls " Highlight on search
set is " Instant search 
set history=100 " Command line history
" Misc options
set showcmd " Display incomplete commands in corner
if has('mouse')
	set mouse=a " Enable mouse in terminal emulator
endif
set autochdir " Switch directory to current buffer
"Indent options
set autoindent
set smartindent
set backspace=indent,eol,start "Allow BS over indentation, newline and start of insert

" Mappings
map <F6> :!g++ %:!./a.out
map <F7> :!./a.out<CR>
