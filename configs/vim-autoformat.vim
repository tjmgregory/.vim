" let g:autoformat_verbosemode=1

" let g:formatdef_prettier = 'prettier'
" let g:formatters_typescript = ['prettier']
" let g:formatters_ts = ['prettier']

let blacklist = ['yaml', 'yml', 'ts', 'typescript', 'tsx']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :Autoformat

au BufWritePre *.ts :Prettier
au BufWritePre *.tsx :Prettier
