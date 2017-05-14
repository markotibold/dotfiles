set nocompatible               " be iMproved
filetype off                   " required!

set termguicolors
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" pass all files in quick-fix window to the arglist
Bundle 'nelstrom/vim-qargs'

" This plugin enables folding by section headings in markdown documents.
Bundle 'nelstrom/vim-markdown-folding'

set shortmess=atOI " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Change cursor shape for iTerm2 on macOS {
  " bar in Insert mode
  " inside iTerm2
  if $TERM_PROGRAM =~# 'iTerm'
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif

  " inside tmux
  "if exists('$TMUX')
    "let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    "let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    "let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  "endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and themes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Bundle 'flazz/vim-colorschemes'
Bundle 'lifepillar/vim-solarized8'
syntax enable
"set background=dark
colorscheme solarized8_dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Efficiency
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" surround.vim: quoting/parenthesizing made simple
Bundle 'tpope/vim-surround'

" CTRL-P: Fuzzy file, buffer, mru, tag, etc finder
Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$\|_build$',
\ 'file': '\.exe$\|\.so$\|\.dll$|\.pyc$|\.orig$'}

" matchit.zip : extended % matching for HTML, LaTeX, and many other languages
Bundle 'matchit.zip'

" undotree.vim : Display your undo history in a graph.
Bundle 'mbbill/undotree'
nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1 " if undotree is opened, it is likely one
                                    " wants to interact with it.

" restore_view.vim : A plugin for automatically restoring file's cursor
" position and folding
Bundle 'vim-scripts/restore_view.vim'

" The NERD Commenter : A plugin that allows for easy commenting of code for
" many filetypes.
Bundle 'scrooloose/nerdcommenter'

" Tabular : Vim script for text filtering and alignment
Bundle 'godlygeek/tabular'

" Tagbar : Display tags of the current file ordered by scope
Bundle 'majutsushi/tagbar'
nnoremap <silent> <leader>tt :TagbarToggle<CR>

" unimpaired.vim : Pairs of handy bracket mappings
Bundle 'tpope/vim-unimpaired'

" Create your own text objects — Read more
Bundle 'kana/vim-textobj-user'

" Text objects for the last searched pattern
Bundle 'kana/vim-textobj-lastpat'

" Start a * or # search from a visual block
Bundle 'nelstrom/vim-visual-star-search'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI Improvements
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" lean & mean status/tabline for vim that's light as air
Bundle 'bling/vim-airline'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linters and stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Bundle 'w0rp/ale'
let g:ale_linters = {
\ 'python': ['flake8'],
\}

" JSHint fork of jslint.vim
Bundle 'wookiehangover/jshint.vim'

Bundle 'fatih/vim-go'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'junegunn/fzf'
Bundle 'junegunn/fzf.vim'
" :Lines (Search through recent lines of text)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Version control
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fugitive.vim : A Git wrapper so awesome, it should be illegal
Bundle 'tpope/vim-fugitive'

" Show a VCS diff using Vim's sign column.
Bundle 'mhinz/vim-signify'

"Splice is a Vim plugin for resolving conflicts during three-way merges.
Bundle 'sjl/splice.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python utils
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'Chiel92/vim-autoformat'

let g:formatter_yapf_style = 'pep8'
" Fast Python completion and Go-to-definition
Bundle 'Valloric/YouCompleteMe'
nnoremap <leader>j :YcmCompleter GoToDefinition<CR>
let g:ycm_autoclose_preview_window_after_completion = 1

" Work with python virtualenvs in vim
Bundle 'jmcantrell/vim-virtualenv'

" Text objects for python
Bundle 'bps/vim-textobj-python'
Bundle 'fisadev/vim-isort'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'tomlion/vim-solidity'

" JSON.vim : A syntax highlighting file for JSON
Bundle 'jakar/vim-json'
" Reindent json
command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool

" JavaScript syntax : Better JavaScript syntax support
Bundle 'pangloss/vim-javascript'

" Add CSS3 syntax support to vim's built-in syntax/css.vim.
Bundle 'hail2u/vim-css3-syntax'

" Markdown : Syntax highlight for Markdown text files
Bundle 'tpope/vim-markdown'

" Syntax highlighting for Django templates
Bundle 'vim-scripts/django.vim'

" CoffeeScript support for vim
Bundle 'kchmck/vim-coffee-script'
" vim-coffee-script autocompile onsave
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

" Vim ini syntax
Bundle 'vim-scripts/ini-syntax-definition'

" Better rst support for vim
Bundle 'Rykka/riv.vim'
" RST preview, run :Rst
" Disable folding behaviour whens saving rst files (should be default)
let g:riv_fold_auto_update = 0

" RST preview, run :Rst
":command Rst :!LC_ALL=en_US.UTF-8 rst2html5 --stylesheet=/Users/marko/.dotfiles/css/bootstrap.css % > /tmp/rstprev.html && open /tmp/rstprev.html

" Puppet syntax
Bundle 'mv/mv-vim-puppet'
" Varnish Configuration Language (VCL)
Bundle 'smerrill/vcl-vim-plugin'

" vim plugin which formated javascript files by js-beautify
" :call HtmlBeautify()
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim Latex plugin
" Download Mactex http://tug.org/mactex/
" brew install latex-mk
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'

" Github mirror of Go vimscripts, synced with main repository
Bundle 'jnwhiteh/vim-golang'

Bundle '4Evergreen4/vim-hardy'

" Plugin to manage Most Recently Used (MRU) files
Bundle 'mru.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Presentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A simple tool for presenting slides in vim based on text files.
Bundle 'sotte/presenting.vim'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General configureation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on     " required!

let mapleader = ','

set nofoldenable
set vb                          " Disable the bell
set colorcolumn=100

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

" Automatically fix common typos
iabbrev teh ihe

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

" Ignore these files in netrw
let g:netrw_list_hide= '.*\.swp$,.*\.pyc,.*\.DS_Store,.*\.orig'

" wildcard ignore, amkes CTRLP plugin more useful
set wildignore=**/.git/,*.pyc,*.orig,*.png,*.fig,*.sql,**/migrations/[0-9][0-9][0-9][0-9]*.py

set backup                  " backups are nice ...
set undofile                "so is persistent undo ...
set undolevels=1000         "maximum number of changes that can be undone
set undoreload=10000        "maximum number lines to save for undo on a buffer reload
set textwidth=99

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

set laststatus=2 " Shows the status line for single windows

" Store spell-files in the ~/.vim/spell directory
setlocal spellfile=~/.vim/spell/en.utf-8.add


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Send last closing bracket to next line
nnoremap <leader>C 0/)$<cr>i<cr><esc>:noh<cr>

" Quicksave command
noremap <Leader>w :update<CR>"

" Invoke iPython's debugger
map <Leader>ib Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Invoke pudb debugger
map <leader>pb Ofrom pdb import set_trace; set_trace()<C-c>

" Easier moving in tabs and windows
noremap <C-> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
noremap <C-H> <C-W>h

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Quickly edit this file
nnoremap <leader>ev :vsplit $HOME/.vimrc<cr>
nnoremap <leader>lev :vsplit $HOME/.vimrc-volatile<cr>
nnoremap <leader>sv :source $HOME/.vimrc<cr>

" autocommands
" Strip trailing whitespaces automotically
autocmd BufWritePre * %s/\s\+$//e

" Load any confs that are not to be commited
source ~/.vimrc-volatile

" Enhanced python highlighting
"hi pythonLambdaExpr      ctermfg=105 guifg=#8787ff
hi pythonInclude         ctermfg=68  guifg=#5f4777
hi pythonClass           ctermfg=167 guifg=#FF62B0
hi pythonParameters      ctermfg=147 guifg=#AAAAFF
hi pythonParam           ctermfg=175 guifg=#E37795
"hi pythonBrackets        ctermfg=183 guifg=#d7afff
hi pythonClassParameters ctermfg=111 guifg=#FF5353
hi pythonSelf            ctermfg=68  guifg=#5f87d7

"hi pythonDottedName      ctermfg=74  guifg=#5fafd7

"hi pythonError           ctermfg=196 guifg=#ff0000
"hi pythonIndentError     ctermfg=197 guifg=#ff005f
"hi pythonSpaceError      ctermfg=198 guifg=#ff0087

"hi pythonBuiltinType     ctermfg=74  guifg=#9191FF
"hi pythonBuiltinObj      ctermfg=71  guifg=#5faf5f
"hi pythonBuiltinFunc     ctermfg=169 guifg=#d75faf cterm=bold gui=bold

"hi pythonException       ctermfg=207 guifg=#CC3366 cterm=bold gui=bold


hi Comment cterm=italic
