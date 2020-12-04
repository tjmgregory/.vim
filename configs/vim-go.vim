" Golang
" Run goimports along gofmt on each save 
let g:go_fmt_command = "goimports"

"Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1

" Autocomplete on . press
au filetype go inoremap <buffer> . .<C-x><C-o>

