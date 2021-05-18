" From the guide: https://shapeshed.com/vim-statuslines/
" To choose colours, run :so $VIMRUNTIME/syntax/hitest.vim
set laststatus=2

function! StoreGitBranch()
    let l:is_git_dir = trim(system('git rev-parse --is-inside-work-tree'))
    if l:is_git_dir is# 'true'
        let g:git_branch = trim(system('git rev-parse --abbrev-ref HEAD'))
    endif
endfunction

autocmd BufEnter * call StoreGitBranch()

function! StatuslineGit()
    return get(g:, 'git_branch', '')
endfunction

set statusline=
set statusline+=%#Visual#
set statusline+=%{StatuslineGit()}
set statusline+=%#Directory#
set statusline+=\ %f
set statusline+=\ %=
set statusline+=\ %#Normal#
set statusline+=\ %y
set statusline+=%#StatusLine#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=%#DiffAdd#
set statusline+=\ %p%%
set statusline+=\ %l:%c
