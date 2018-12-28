" autocommands
" Strip trailing whitespaces automotically
autocmd BufWritePre * %s/\s\+$//e

autocmd BufWritePre *.py execute ':Black'
