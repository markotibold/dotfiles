set termguicolors

packadd minpac
call minpac#init()

let mapleader = ','
scriptencoding utf-8
set backspace=indent,eol,start  " backspace for dummies
set colorcolumn=84
set cursorline                  " highlight current line
set history=1000                " Store a ton of history (default is 20)
set hlsearch                    " highlight search terms
set ignorecase                  " case insensitive search
set incsearch                   " find as you type search
set linespace=0                 " No extra spaces between rows
set mouse=a                     " automatically enable mouse usage
set mousehide                   " hide the mouse cursor while typing
set nofoldenable
set shortmess=atOI " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts
set showmatch                   " show matching brackets/parenthesis
set smartcase                   " case sensitive when uc present
set spell                       " spell checking on
set vb                          " Disable the bell

syntax enable
syntax on

" Formatting
set autoindent                  " indent at the same level of the previous line
set expandtab                   " tabs are spaces, not tabs
set nowrap                      " wrap long lines
set shiftwidth=4                " use indents of 4 spaces
set softtabstop=4               " let backspace delete indent
set tabstop=4                   " an indentation every four columns

" Paste mode prevents indenting text when pasting
set pastetoggle=<F2>

" reload file when changes happen in other editors
set autoread

" yank to the global system clipboard
let s:uname = system("uname")
if s:uname == "Darwin\n"
    " Do Mac stuff here
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif


set backup                  " backups are nice ...
set laststatus=2 " Shows the status line for single windows
set nolist " Don't display end of line chars in some cases
set number
set textwidth=84
set undofile                "so is persistent undo ...
set undolevels=1000         "maximum number of changes that can be undone
set undoreload=10000        "maximum number lines to save for undo on a buffer reload

" Ignore these files in netrw
let g:netrw_banner=0 " disable banner at top
let g:netrw_liststyle=3
let g:netrw_list_hide= '.*\.swp$,.*\.pyc,.*\.DS_Store,.*\.orig'
" wildcard ignore, makes CTRLP plugin more useful
set wildignore=**/.git/,*.pyc,*.orig,*.png,*.fig,*.sql,**/migrations/[0-9][0-9][0-9][0-9]*.py


" Store spell-files in the ~/.vim/spell directory
setlocal spellfile=~/.vim/spell/en.utf-8.add

" Load any confs that are not to be committed
source ~/.vimrc-volatile

filetype plugin indent on

let g:python_host_prog = '/Users/m.tibold/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/m.tibold/.pyenv/versions/neovim3/bin/python'

for s:path in split(glob('~/.dotfiles/vim/*.vim'), "\n")
    exe 'source ' . s:path
endfor
for s:path in split(glob('~/.dotfiles/vim/pluginconf/*.vim'), "\n")
    exe 'source ' . s:path
endfor

colorscheme solarized8
