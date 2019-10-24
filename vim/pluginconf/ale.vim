let g:ale_linters = {
            \ 'json': ['jsonlint'],
            \ 'ansible': ['ansible-lint'],
            \ 'javascript': ['jshint'],
            \}

"            \ 'python': ['flake8'],
" Note pylint doesn't parse text from stdin, so it can only lint on_enter and on_save.
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_insert_leave = 1

