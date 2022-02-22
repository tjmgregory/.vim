" General
" Set leader key
let mapleader="s"

" Better ESC
inoremap kj <ESC>
inoremap <ESC> <NOP>
vnoremap kj <ESC>
vnoremap <ESC> <NOP>
cnoremap kj <ESC>

" Relative line numbers if you're in normal mode
set number
let g:rnu_enabled=1
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if g:rnu_enabled && &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if g:rnu_enabled && &nu                  | set nornu | endif
augroup END

function! s:toggle_rnu()
  if (g:rnu_enabled == 1)
    let g:rnu_enabled=0
    set nornu
  else
    let g:rnu_enabled=1
    set rnu
  endif
endfunction

nnoremap <silent> <leader>` :call <SID>toggle_rnu()<CR>

" Line and column highlighting
set cursorline
set cursorcolumn

" Syntax highlighting
if !exists('g:syntax_on')
  syntax on
  " How many lines Vim should look back for a recognised syntax state
  " https://vim.fandom.com/wiki/Fix_syntax_highlighting
  autocmd BufEnter * :syntax sync minlines=200
endif
set re=0

" Colour scheme
if !exists('g:loaded_color')
  let g:loaded_color = 1

  " Put your favorite colorscheme here
  colo codedark
endif

filetype plugin indent on
" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.

" Spaces not tabs
set tabstop=2 softtabstop=0 expandtab shiftwidth=2

" Create splits with - |
nnoremap <silent> - <C-w>s
nnoremap <silent> \| <C-w>v

" tmux integrated window navigation
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" Tab navigation
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>
" nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
" nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

nnoremap <silent> <C-w>c :tabedit<CR>
nnoremap <silent> <C-w>x :tabclose<CR>
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tt gt

" Flash screen instead of beep sound
set visualbell

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8

" Show the leader key in the bottom when it has been activated
set showcmd

" Leader key saving and exiting
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Split to the right and below
set splitbelow
set splitright

" " Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+yy

" terminal
nmap <leader>t :vert term<CR>
nmap <leader>T :tab term<CR>

" Dont continue comments on enter
set formatoptions-=cro

" Allow opening of new buffers when the current contains unsaved changes
set hidden

" Set wildcard ignore
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*.git

" Set search casing
nmap <leader>/ :set ignorecase! ignorecase?<CR>
set ignorecase
set smartcase

" Set scroll margin from top and bottom
set scrolloff=10

" Make all JS TS
augroup SyntaxSettings
  autocmd!
  autocmd BufNewFile,BufRead *.jsx set filetype=typescriptreact
  autocmd BufNewFile,BufRead *.js set filetype=typescript
augroup END

" Shortcut to delete all buffers not currently shown (Will delete other tabs
" too)
function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()
