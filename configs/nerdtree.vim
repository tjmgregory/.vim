" NERDTree
"" Open with vim if no file specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" File visibility
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1

" Improved finding shortcuts
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>

" Allow deleting files
set modifiable

" Match file opening commmands of ripgrep/fzf
let NERDTreeMapOpenSplit='<C-x>'
let NERDTreeMapOpenVSplit='<C-v>'

" Greater default NT width
let g:NERDTreeWinSize = 45
