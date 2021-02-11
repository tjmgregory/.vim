" NERDTree
"" Open with vim if no file specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" File visibility
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$', '\.git$'] " ignore files in nerd tree

" Improved finding shortcuts
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>

" Allow deleting files
set modifiable

" Match file opening commmands of ripgrep/fzf
let NERDTreeMapOpenSplit='<C-x>'
let NERDTreeMapOpenVSplit='<C-v>'
