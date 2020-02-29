let g:formatters_python = ['black']

let g:autoformat_autoindent = 0

" Tweak for terraform
function! Dinges()
!terraform fmt %
:edit
endfunction
autocmd bufwritepost *.tf silent :call Dinges()
