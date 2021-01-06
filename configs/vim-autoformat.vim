au BufWritePre !*.ts :Autoformat
au BufWritePre *.ts :Prettier

let g:formatters_typescript = ['prettier']
