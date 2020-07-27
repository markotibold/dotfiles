let g:formatters_python = []

"let g:autoformat_verbosemode=1
let g:autoformat_autoindent = 0

" Tweak for terraform
function! Dinges()
!terraform fmt %
:edit
endfunction
autocmd bufwritepost *.tf silent :call Dinges()

" workaround for black
function! Dinges1()
!black %
:e
endfunction
autocmd bufwritepost *.py silent :call Dinges1()
