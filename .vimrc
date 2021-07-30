" Make Vim more useful
set nocompatible
" sets gvim language to Engish
set langmenu=en_US.UTF-8
" sets vim language to English
language en
" set path for fuzzysearch(can find every file recursively based on current directory)
set path+=**
" Enable wildmenu to navigate through the completion lists
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Allow backspace in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" Optimize for fast terminal connections
set ttyfast
" Enable line number
set number
" Enable relative number
set relativenumber
" Enable syntax highlighting
syntax enable
" Highlight current line
set cursorline
" Make tabs as wide as four spaces
set tabstop=4 softtabstop=4
" Make tabs using <, > as four spaces
set shiftwidth=4
" Expand tab to spaces
set expandtab
" Show invisible characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case when searches
set ignorecase
" Highlight character instantly when searches
set incsearch
" Set cursor to briefly jump to the matching brace when insert one
set showmatch
" Disable annoying sound when error
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Disable redraw while executing macros (good performance config)
set lazyredraw 
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

" Use the https://github.com/nanotech/jellybeans.vim Dark theme
set background=dark
colorscheme jellybeans
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

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

" Fast saving
nmap <leader>w :w!<cr>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Make tag files
command! MakeTags !ctags -R .

" Configure netrc
" shortcut => open: <CR>/v or <CR>/t, exit: only or tabonly
" Disable annoying banners that covers half of the screen
let g:netrw_banner=0
" Open file in prior window
let g:netrw_browse_split=4
" Open file splits to the right
let g:netrw_altv=1
" Set List sytle to tree view
let g:betrw_liststyle=3
