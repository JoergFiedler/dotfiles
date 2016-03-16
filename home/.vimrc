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
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'leshill/vim-json'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'ap/vim-css-color'
Plugin 'kchmck/vim-coffee-script'
Plugin 'airblade/vim-gitgutter'
Plugin 'digitaltoad/vim-jade'
Plugin 'genoma/vim-less'
Plugin 'wincent/command-t'
call vundle#end()

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
set autoread " automatically load fs changes
set autowriteall " save buffer on switch
set undofile " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000 " How many undos
set undoreload=10000 " number of lines to save for undo
set wildignore=**/.git/,**/.idea/,**/.repo/,**/node_modules,**/bower_components
let g:NERDTreeWinSize = 40 
call system('mkdir -p ' . &undodir)

map <C-n> :NERDTreeToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 6
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = "-c ~/projects/here/datalens-tool/components/angular_modules/.eslintrc"
let g:CommandTMaxHeight = 30
let g:CommandTInputDebounce = 50
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
