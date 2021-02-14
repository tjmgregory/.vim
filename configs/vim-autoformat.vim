let blacklist = ['yaml', 'yml']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :Autoformat

