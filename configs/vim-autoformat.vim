let blacklist = ['yaml', 'yml', 'py', 'python']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :Autoformat
