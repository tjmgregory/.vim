" coc
let g:coc_global_extensions = []

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> gD :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gY :call CocAction('jumpTypeDefinition', 'vsplit')<CR>
nmap <silent> gI :call CocAction('jumpImplementation', 'vsplit')<CR>
nmap <silent> gR :call CocAction('jumpReferences', 'vsplit')<CR>

" Adds prettier support
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
vnoremap <Leader>p :Prettier<CR>
vnoremap <Leader>P :Prettier a<CR>
nnoremap <Leader>p :Prettier<CR>
nnoremap <Leader>P :Prettier a<CR>

" Remap keys for applying codeAction to the current line.
imap <leader>a <Plug>(coc-codeaction)
nmap <leader>a <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
imap <leader>f <Plug>(coc-fix-current)
nmap <leader>f <Plug>(coc-fix-current)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <c-@> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)

" Move a file and update imports
nmap <leader>m :CocCommand workspace.renameCurrentFile<CR>

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
    nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
    inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-j>=coc#float#scroll(1)\<cr>" : "\<C-j>"
    inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-k>=coc#float#scroll(0)\<cr>" : "\<C-k>"
    vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
    vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
endif

hi! link CocErrorHighlight CodeError

" Restart
nnoremap <leader>R :CocRestart<CR>
