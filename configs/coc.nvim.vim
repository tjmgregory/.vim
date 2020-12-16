" coc
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-prettier' ]

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Adds prettier support
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
