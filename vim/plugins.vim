" Linters / Formatters
call minpac#add('psf/black')

" how does it relate to above plugin?
call minpac#add('Chiel92/vim-autoformat')


"-----------------------------------------
" Completers
"
call minpac#add('Valloric/YouCompleteMe')


"-----------------------------------------
" Fancy stuff
"
"call minpac#add('bling/vim-airline')


" Won't use?
"-----------------------------------------

"" vim-text-obj-python depends on vim-textobj-user
"call minpac#add('kana/vim-textobj-user')
"call minpac#add('bps/vim-textobj-python')
"

"" TODO relearn
call minpac#add('godlygeek/tabular')
"" easier I guess
call minpac#add('junegunn/vim-easy-align')

"" TODO relearn
"call minpac#add('SirVer/ultisnips')
"call minpac#add('honza/vim-snippets')

call minpac#add('alfredodeza/pytest.vim')

"call minpac#add('lifepillar/vim-solarized8')

call minpac#add('morhetz/gruvbox')

""Visual undotree
"call minpac#add('mbbill/undotree')

"" Shows a git gutter
call minpac#add('mhinz/vim-signify')

"" Make a visual selection and than hit '*' to search for that pattern
"call minpac#add('nelstrom/vim-visual-star-search')

"" <leader>c will work in most filetypes
call minpac#add('scrooloose/nerdcommenter')

"" Tool for resolving merge conflicts
"call minpac#add('sjl/splice.vim')

"" Slideshows in vim
"call minpac#add('sotte/presenting.vim')

"" TODO learn me!!
" hmz, maybe just stick with lazygit
"call minpac#add('tpope/vim-fugitive')

call minpac#add('shime/vim-livedown')

"" TODO learn me!!
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')

call minpac#add('tpope/vim-surround')
" repeat plugin maps, do I use it?
"call minpac#add('tpope/vim-repeat')

"" A bunch of mappings ([q, ]q etc...)
call minpac#add('tpope/vim-unimpaired')

call minpac#add('vim-scripts/mru.vim')

"" Restore cursor position after re-opening file
call minpac#add('vim-scripts/restore_view.vim')

"" A personal wiki for vim
""call minpac#add('vimwiki/vimwiki')

"" **************** LINTING and FORMATTING
"" Worpale(async) replaces syntastic(blocking)
"" linters: pylint

"" # TODO prettify hilighting/tweak
call minpac#add('w0rp/ale')

"" See https://github.com/sheerun/vim-polyglot/issues/779
call minpac#add('sheerun/vim-polyglot')

"" Sort python imports :Isort
call minpac#add('stsewd/isort.nvim')

call minpac#add('hashivim/vim-terraform')
