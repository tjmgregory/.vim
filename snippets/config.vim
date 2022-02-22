nnoremap <leader>sll :read $HOME/.vim/snippets/console_log.ts<CR>:r! echo $RANDOM<CR>"bd$kJ<Esc>^f-"bpt}i
nnoremap <leader>slj :read $HOME/.vim/snippets/console_log_json.ts<CR>:r! echo $RANDOM<CR>"bd$kJ<Esc>^f-"bpt}i
nnoremap <leader>stc :read $HOME/.vim/snippets/try_catch.ts<CR>:r! echo $RANDOM<CR>"bd$J<Esc>2jf-"bp2ka<Tab>

nnoremap <leader>stt :read $HOME/.vim/snippets/test_sync.ts<CR>:Format<CR>2t'a
nnoremap <leader>sta :read $HOME/.vim/snippets/test_async.ts<CR>:Format<CR>2t'a
nnoremap <leader>std :read $HOME/.vim/snippets/test_describe.ts<CR>:Format<CR>2t'a

nnoremap <leader>src :read $HOME/.vim/snippets/react_component.ts<CR>:%s/Component/
