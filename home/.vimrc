set encoding=utf-8
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
" installed bundles
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'leshill/vim-json'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'ap/vim-css-color'
Bundle 'kchmck/vim-coffee-script'

" syntastic/pathogen
execute pathogen#infect()
"
" some basic settings
set term=screen-256color
syn on " syntax highlighting
set nu " enable line numbers

filetype plugin indent on

" Swap and backup
set nobackup
set noswapfile
set nowritebackup

" Use filetype-specific plugins and indentation
set nosmartindent
" Enable filetype detection
filetype plugin indent on
" Enable modeline support as it is disabled by default
" in OS X
set modelines=1

colorscheme bubblegum

" vim powerline (airline) settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set laststatus=2 " always show statusbar

" Configure white spaces
set list
set listchars=eol:¬,tab:……,trail:‸,extends:>,precedes:<

set incsearch " Jump to the first match in real-time
set ignorecase " Case insensitive search, by default.
set smartcase " Case-sensitive if there any capital letters
set hidden " Allow changing buffers even with modifications
set title " Modify the terminal title

map <C-n> :NERDTreeToggle<CR>

