" autocommands
" Strip trailing whitespaces automatically
autocmd BufWritePre * %s/\s\+$//e

au BufWrite * :Autoformat
