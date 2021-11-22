" General
" Set leader key
let mapleader="s"

" Relative line numbers if you're in normal mode
set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Line and column highlighting
set cursorline
set cursorcolumn

" Syntax highlighting
if !exists('g:syntax_on')
  syntax on
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

" Tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

nnoremap <silent> <C-w>c :tabedit<CR>
nnoremap <silent> <C-w>x :tabclose<CR>
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
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
