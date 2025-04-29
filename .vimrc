" Make Vim more useful
set nocompatible
" sets gvim language to English
" set langmenu=en_US.UTF-8
" sets vim language to English
" language en_US.UTF-8
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
"  set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"  set list
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
" set vim to use primary (* - copy on select) clipboard
"  set clipboard=unnamed
" Create swap, backup, undo files in a special location. (two trailing slashes avoids name collision)
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
" Enable Detection, Plugin, Indent at once
filetype plugin indent on

" Install jellybeans theme first
" mkdir -p ~/.vim/colors && cd ~/.vim/colors && curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
set background=dark
colorscheme jellybeans
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" when reopening a file move pos to " mark 
" " mark stores the last position in the current file and is saved in the ~/.viminfo file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
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

" Get prettier (`yarn global add prettier` first)
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

" vim easy align
nmap ga <Plug>(EasyAlign) " start EasyAlign in visual mode (e.g. vipga=, vipga2=, vipga*=)
xmap ga <Plug>(EasyAlign) " start EasyAlign for motion/text object (e.g. gaip=, gaip2=, gaip*=)

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

" Make sure you use single quotes
call plug#begin()
" Shorthand notation;
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

let g:airline_powerline_fonts = 1
let g:airline_theme='ayu_dark'
