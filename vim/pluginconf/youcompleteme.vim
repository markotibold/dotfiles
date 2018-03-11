nnoremap <leader>j :YcmCompleter GoToDefinition<CR>
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = 'python'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

