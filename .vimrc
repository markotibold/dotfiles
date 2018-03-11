set termguicolors

packadd minpac
call minpac#init()

" pass all files in quick-fix window to the arglist
call minpac#add('nelstrom/vim-qargs')

" This plugin enables folding by section headings in markdown documents.
call minpac#add('nelstrom/vim-markdown-folding')

set shortmess=atOI " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and themes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call minpac#add('lifepillar/vim-solarized8')
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Efficiency
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" surround.vim: quoting/parenthesizing made simple
call minpac#add('tpope/vim-surround')

" automatic sessions saving
call minpac#add('tpope/vim-obsession')

" undotree.vim : Display your undo history in a graph.
call minpac#add('mbbill/undotree')
nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1 " if undotree is opened, it is likely one
                                    " wants to interact with it.

" restore_view.vim : A plugin for automatically restoring file's cursor
" position and folding
call minpac#add('vim-scripts/restore_view.vim')

" The NERD Commenter : A plugin that allows for easy commenting of code for
" many filetypes.
call minpac#add('scrooloose/nerdcommenter')

" Tabular : Vim script for text filtering and alignment
call minpac#add('godlygeek/tabular')

" Tagbar : Display tags of the current file ordered by scope
call minpac#add('majutsushi/tagbar')
nnoremap <silent> <leader>tt :TagbarToggle<CR>

" unimpaired.vim : Pairs of handy bracket mappings
call minpac#add('tpope/vim-unimpaired')

" Create your own text objects — Read more
call minpac#add('kana/vim-textobj-user')
let test#python#runner = 'pytest'

" Text objects for the last searched pattern
call minpac#add('kana/vim-textobj-lastpat')

" Start a * or # search from a visual block
call minpac#add('nelstrom/vim-visual-star-search')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI Improvements
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" lean & mean status/tabline for vim that's light as air
call minpac#add('bling/vim-airline')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linters and stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call minpac#add('w0rp/ale')
let g:ale_linters = {
\ 'python': ['flake8'],
\ 'json': ['jsonlint'],
\ 'ansible': ['ansible-lint'],
\ 'javascript': ['jshint'],
\}

call minpac#add('fatih/vim-go')
call minpac#add('terryma/vim-multiple-cursors')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('pearofducks/ansible-vim')

" :Lines (Search through recent lines of text)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Version control
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fugitive.vim : A Git wrapper so awesome, it should be illegal
call minpac#add('tpope/vim-fugitive')

call minpac#add('tpope/vim-projectionist')

" Show a VCS diff using Vim's sign column.
call minpac#add('mhinz/vim-signify')
let g:signify_vcs_list = ['git']
"Splice is a Vim plugin for resolving conflicts during three-way merges.
call minpac#add('sjl/splice.vim')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python utils
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call minpac#add('python-mode/python-mode')
let g:pymode_lint = 0
let g:pymode_indent = 0
let g:pymode_syntax = 1
let g:pymode_rope = 1
let g:pymode_run = 1
let g:pymode_rope_completion = 0
let g:pymode_virtualenv = 1
let g:pymode_rope_autoimport=1
let g:pymode_rope_autoimport_bind = '<C-c>ra'
let g:pymode_rope_rename_bind = '<C-c>rr'
let g:pymode_rope_rename_module_bind = '<C-c>r1r'
let g:pymode_rope_organize_imports_bind = '<C-c>ro'

let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']
call minpac#add('Chiel92/vim-autoformat')
let g:formatter_yapf_style = 'pep8'
" Just do a visual select and thden run :!yapf
" Fast Python completion and Go-to-definition
call minpac#add('Valloric/YouCompleteMe')
nnoremap <leader>j :YcmCompleter GoToDefinition<CR>
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = 'python'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Work with python virtualenvs in vim
call minpac#add('jmcantrell/vim-virtualenv')
" Text objects for python
call minpac#add('bps/vim-textobj-python')
call minpac#add('fisadev/vim-isort')
call minpac#add('janko-m/vim-test')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call minpac#add('tomlion/vim-solidity')

" JSON.vim : A syntax highlighting file for JSON
call minpac#add('jakar/vim-json')
" Reindent json
command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool

" JavaScript syntax : Better JavaScript syntax support
call minpac#add('pangloss/vim-javascript')

" Add CSS3 syntax support to vim's built-in syntax/css.vim.
call minpac#add('hail2u/vim-css3-syntax')

" Markdown : Syntax highlight for Markdown text files
call minpac#add('tpope/vim-markdown')

" Syntax highlighting for Django templates
call minpac#add('vim-scripts/django.vim')

" CoffeeScript support for vim
call minpac#add('kchmck/vim-coffee-script')
" vim-coffee-script autocompile onsave
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

" npm install -g livedown
call minpac#add('shime/vim-livedown')

" Varnish Configuration Language (VCL)
call minpac#add('smerrill/vcl-vim-plugin')

" vim plugin which formated javascript files by js-beautify
" :call HtmlBeautify()
call minpac#add('maksimr/vim-jsbeautify')
call minpac#add('einars/js-beautify')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim Latex plugin
" Download Mactex http://tug.org/mactex/
" brew install latex-mk
"call minpac#add('git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex')
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'

" Github mirror of Go vimscripts, synced with main repository
call minpac#add('jnwhiteh/vim-golang')

" Arduino syntax
call minpac#add('4Evergreen4/vim-hardy')

" Plugin to manage Most Recently Used (MRU) files
call minpac#add('vim-scripts/mru.vim')

call minpac#add('SirVer/ultisnips')
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
call minpac#add('honza/vim-snippets')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Presentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A simple tool for presenting slides in vim based on text files.
call minpac#add('sotte/presenting.vim')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General configureation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
set number

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
nnoremap <leader>al :vsplit $HOME/awlog.md
nnoremap <leader>et :vsplit $HOME/.dotfiles/vim-notes.md<cr>
nnoremap <leader>lev :vsplit $HOME/.vimrc-volatile<cr>
nnoremap <leader>sv :source $HOME/.vimrc<cr>

" autocommands
" Strip trailing whitespaces automotically
autocmd BufWritePre * %s/\s\+$//e

hi Comment cterm=italic

" Load any confs that are not to be commited
source ~/.vimrc-volatile

filetype plugin indent on
hi clear SpellBad
hi SpellBad cterm=underline

let g:python_host_prog  = '/Users/m.tibold/envs/neovim/bin/python'
"let g:python3_host_prog = '/usr/local/bin/python3'
"au! BufRead,BufNewFile *.yml set filetype=ansible
