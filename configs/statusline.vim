" From the guide: https://shapeshed.com/vim-statuslines/
" To choose colours, run :so $VIMRUNTIME/syntax/hitest.vim
set laststatus=2

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#Visual#
set statusline+=%{StatuslineGit()}
set statusline+=%#Directory#
set statusline+=\ %f
set statusline+=\ %=
set statusline+=\ %#Normal#
set statusline+=\ %y
set statusline+=\ %l:%c
