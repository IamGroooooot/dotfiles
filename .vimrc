" Make Vim more useful
set nocompatible
" set path for fuzzysearch(can find every file recursively based on current directory)
set path+=**
" Enable <Left> or <Right> to navigate through the completion lists
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Enable line number
set number
" Enable relative number
set relativenumber
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as four spaces
set tabstop=4
" Make tabs using <, > as four spaces
set shiftwidth=4
" Show invisible characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case when searches
set ignorecase
" Highlight character instantly when searches
set incsearch
" Set cursor to briefly jump to the matching brace when insert one
set showmatch
" Disable error bells
set noerrorbells
" Show the cursor position
set ruler
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show currently typing command
set showcmd
" Set 8 lines to see above and below the cursor
set scrolloff=8
" Enable auto writing when moved to other file
set autowrite
" Enable Detection, Plugin, Indent at once
filetype plugin indent on
" Use the Solarized Dark theme
set background=dark
colorscheme solarized

" Change mapleader
let mapleader=","

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Get prettier
nnoremap gp :silent %!prettier --stdin-filepath %<CR>
