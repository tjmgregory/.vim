let blacklist = ['yaml', 'yml', 'ts']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :Autoformat

au BufWritePre *.ts :Prettier
" let g:formatters_typescript = ['prettier']
