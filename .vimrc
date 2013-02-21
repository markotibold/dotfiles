set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
 
Bundle 'mileszs/ack.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'spf13/vim-colors'
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'matchit.zip'
Bundle 'Lokaltog/vim-powerline'
Bundle 'godlygeek/csapprox'
Bundle 'mbbill/undotree'
Bundle 'myusuf3/numbers.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/restore_view.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'Shougo/neocomplcache'

Bundle 'davidhalter/jedi-vim'
Bundle 'klen/python-mode'

Bundle 'leshill/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'


Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'hail2u/vim-css3-syntax'


Bundle 'tpope/vim-markdown'
Bundle 'spf13/vim-preview'

Bundle 'vim-scripts/django.vim'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'vim-django'
Bundle 'kchmck/vim-coffee-script'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
 

let mapleader = ','

" My bundle settings 
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
    " vim-django:
    let g:django_projects = '~/devshare'    "vim-django: Sets all projects under devshare
    let g:django_activate_virtualenv = 1    "vim-django: Try to activate the associated virtualenv
    let g:django_activate_nerdtree = 1      "vim-django: Start NERDTree upon activation

    " vim-coffee-script autocompile onsave
    au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

" My UI related settings 
    set vb                      " Disable the bell
    set guifont=Monaco:h12
    colorscheme wombat
    set incsearch
    set colorcolumn=120
    set nospell                 " Why doesn't this stick??
    syntax on
    set mouse=a                 " automatically enable mouse usage
    set mousehide               " hide the mouse cursor while typing
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

    autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()

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

    let g:pymode_lint_checker = "pyflakes"
    let g:pymode_utils_whitespaces = 0

    let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.hg$\|\.svn$',
	\ 'file': '\.exe$\|\.so$\|\.dll$' }

    let g:neocomplcache_enable_at_startup = 1
    if !exists('g:neocomplcache_omni_functions')
	let g:neocomplcache_omni_functions = {}
    endif
    let g:neocomplcache_omni_functions['python'] = 'jedi#complete'
    let g:jedi#popup_on_dot = 0

    " Plugin key-mappings.
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)

    " <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

    nnoremap <Leader>u :UndotreeToggle<CR>
    let g:undotree_SetFocusWhenToggle=1 " if undotree is opened, it is likely one wants to interact with it.

     " indent_guides {
        if !exists('g:spf13_no_indent_guides_autocolor')
            let g:indent_guides_auto_colors = 1
        else
            " for some colorscheme ,autocolor will not work,like 'desert','ir_black'.
            autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121   ctermbg=3
            autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
        endif
        set ts=4 sw=4 et
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
     " }

" My mappings 
    " Execute file being edited with <Shift> + e:
    map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

    " Rope mappings:
    map <leader>j :RopeGotoDefinition<CR>

    inoremap jj <ESC> "jj brings you back to normal mode from insert mode

    " Move current line up / down
    nnoremap <C-cr> ddp
    nnoremap <S-C-cr> ddkP

    " Uppercase current word
    nnoremap <C-u> vawUe
    inoremap <C-u> <ESC>vawUi

    " Quickly edit this file
    nnoremap <leader>ev :vsplit $HOME/.vimrc<cr>
    nnoremap <leader>sv :source $HOME/.vimrc<cr>

    " Automatically fix common typos
    iabbrev teh ihe

    " Quickly switch between open windows
    nnoremap <leader>h <C-w>h
    nnoremap <leader>l <C-w>l

    " Quickly go to next buffer
    nnoremap <C-n> :bn<cr>

    " Fold and unfold with space
    nnoremap <space> za

    " Paste mode prevents indenting text when pasting
    set pastetoggle=<F2>

    " unfold all folds 
    nnoremap <S-space> zR

    " Sorting
    vnoremap <leader>s :sort <CR>

    " reload file when changes happen in other editors
    set autoread 

    " make yank copy to the global system clipboard
    set clipboard=unnamed

    " Quicksave command
    noremap <Leader>w :update<CR>"