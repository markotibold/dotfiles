set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" pass all files in quick-fix window to the arglist
Bundle 'nelstrom/vim-qargs' 

" This plugin enables folding by section headings in markdown documents.
Bundle 'nelstrom/vim-markdown-folding'

" Colors and themes
Bundle 'altercation/vim-colors-solarized'
Bundle 'nelstrom/vim-mac-classic-theme' 
Bundle 'spf13/vim-colors'
Bundle 'flazz/vim-colorschemes'
Bundle 'd11wtq/tomorrow-theme-vim'

" surround.vim: quoting/parenthesizing made simple
Bundle 'tpope/vim-surround'

" Fuzzy file, buffer, mru, tag, etc finder
Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$',
\ 'file': '\.exe$\|\.so$\|\.dll$|\.pyc$' }

" matchit.zip : extended % matching for HTML, LaTeX, and many other languages 
Bundle 'matchit.zip'

" vim-powerline : The ultimate vim statusline utility. 
Bundle 'Lokaltog/vim-powerline'

" CSApprox : Make gvim-only colorschemes work transparently in terminal vim 
Bundle 'godlygeek/csapprox'

" undotree.vim : Display your undo history in a graph. 
Bundle 'mbbill/undotree'
nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1 " if undotree is opened, it is likely one wants to interact with it.

" better line numbers for vim
Bundle 'myusuf3/numbers.vim'

" Indent Guides : A plugin for visually displaying indent levels in Vim. 
Bundle 'nathanaelkane/vim-indent-guides'

" restore_view.vim : A plugin for automatically restoring file's cursor
" position and folding 
Bundle 'vim-scripts/restore_view.vim'

" Syntastic : Automatic syntax checking 
Bundle 'scrooloose/syntastic'

" fugitive.vim : A Git wrapper so awesome, it should be illegal 
Bundle 'tpope/vim-fugitive'

" The NERD Commenter : A plugin that allows for easy commenting of code for
" many filetypes. 
Bundle 'scrooloose/nerdcommenter'

" Tabular : Vim script for text filtering and alignment 
Bundle 'godlygeek/tabular'

" Tagbar : Display tags of the current file ordered by scope 
Bundle 'majutsushi/tagbar'
nnoremap <silent> <leader>tt :TagbarToggle<CR>

Bundle 'Valloric/YouCompleteMe'
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion = 1

"Python-mode is a vim plugin that allows you to use the pylint, rope, pydoc
"library in vim to provide features like python code looking for bugs,
"refactoring and some other usefull things. 
Bundle 'klen/python-mode'
let g:pymode_lint_checker = "pyflakes"
let g:pymode_utils_whitespaces = 0

" JSON.vim : A syntax highlighting file for JSON 
Bundle 'jakar/vim-json'

" JavaScript syntax : Better JavaScrirpt syntax support 
Bundle 'pangloss/vim-javascript'

" Add CSS3 syntax support to vim's built-in syntax/css.vim.
Bundle 'hail2u/vim-css3-syntax'

" Markdown : Syntax highlight for Markdown text files 
Bundle 'tpope/vim-markdown'

" unimpaired.vim : Pairs of handy bracket mappings 
Bundle 'tpope/vim-unimpaired'

" Syntax highlighting for Django templates
Bundle 'vim-scripts/django.vim'

" Work with python virtualenvs in vim
Bundle 'jmcantrell/vim-virtualenv'

" CoffeeScript support for vim
Bundle 'kchmck/vim-coffee-script'
" vim-coffee-script autocompile onsave
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

filetype plugin indent on     " required!

let mapleader = ','

set vb                          " Disable the bell
set guifont=Monaco:h12
colorscheme professional
set colorcolumn=80
syntax on
set mouse=a                     " automatically enable mouse usage
set mousehide                   " hide the mouse cursor while typing

scriptencoding utf-8

set history=1000                " Store a ton of history (default is 20)
set spell                       " spell checking on
set cursorline                  " highlight current line

set backspace=indent,eol,start  " backspace for dummies
set linespace=0                 " No extra spaces between rows
set showmatch                   " show matching brackets/parenthesis
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present

" Formatting 
set nowrap                      " wrap long lines
set autoindent                  " indent at the same level of the previous line
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " let backspace delete indent

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Quickly edit this file
nnoremap <leader>ev :vsplit $HOME/.vimrc<cr>
nnoremap <leader>sv :source $HOME/.vimrc<cr>

" Automatically fix common typos
iabbrev teh ihe

" Fold and unfold with space
nnoremap <space> za

" Paste mode prevents indenting text when pasting
set pastetoggle=<F2>

" unfold all folds 
nnoremap <S-space> zR

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

" Quicksave command
noremap <Leader>w :update<CR>"

map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" netrw ignore
let g:netrw_list_hide= '.*\.swp$,.*\.pyc,.*\.DS_Store'

set backup                  " backups are nice ...
set undofile                "so is persistent undo ...
set undolevels=1000         "maximum number of changes that can be undone
set undoreload=10000        "maximum number lines to save for undo on a buffer reload

" shameless copy from spf13
function! InitializeDirectories()
    let separator = "."
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . prefix . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

set nolist " Don't display end of line chars in some cases

set wildignore=*.pyc,*.png,*.fig,*.sql

set laststatus=2 " Shows the status line for single windows

" Store spell-files in the ~/.vim/spell directory
setlocal spellfile=~/.vim/spell/en.utf-8.add

" Reindent json 
command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool
