" Send last closing bracket to next line
nnoremap <leader>C 0/)$<cr>i<cr><esc>:noh<cr>

" Quicksave command
noremap <Leader>w :update<CR>"

" Invoke iPython's debugger
map <Leader>ib Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Invoke pudb debugger
map <leader>pb Ofrom pdb import set_trace; set_trace()<C-c>


" Quickly edit this file
nnoremap <leader>ev :vsplit $HOME/.dotfiles/.vimrc<cr>
nnoremap <leader>al :vsplit $HOME/awlog.md
nnoremap <leader>et :vsplit $HOME/vim-notes.md<cr>
nnoremap <leader>lev :vsplit $HOME/.vimrc-volatile<cr>
nnoremap <leader>sv :source $HOME/.vimrc<cr>
nnoremap <leader>, :Explore<cr>

