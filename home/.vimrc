set encoding=utf-8
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" installed bundles
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'leshill/vim-json'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'ap/vim-css-color'
Plugin 'kchmck/vim-coffee-script'

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

" use pastboard service
set clipboard=unnamed

" Use filetype-specific plugins and indentation
set nosmartindent
" Enable filetype detection
filetype plugin indent on
" Enable modeline support as it is disabled by default
" in OS X
set modelines=1
" Indentation without hard tabs
set expandtab
set shiftwidth=2
set softtabstop=2

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

