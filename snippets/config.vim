nnoremap <leader>sll :read $HOME/.vim/snippets/console_log.ts<CR>:r! echo $RANDOM<CR>"bd$kJ<Esc>^f-"bpt}i
nnoremap <leader>slj :read $HOME/.vim/snippets/console_log_json.ts<CR>:r! echo $RANDOM<CR>"bd$kJ<Esc>^f-"bpt}i
nnoremap <leader>stc :read $HOME/.vim/snippets/try_catch.ts<CR>:r! echo $RANDOM<CR>"bd$J<Esc>2jf-"bp2ka<Tab>

nnoremap <leader>st :read $HOME/.vim/snippets/unit_test.ts<CR>2t'a
nnoremap <leader>sd :read $HOME/.vim/snippets/unit_describe.ts<CR>2t'a

nnoremap <leader>src :read $HOME/.vim/snippets/react_component.ts<CR>:%s/Component/
