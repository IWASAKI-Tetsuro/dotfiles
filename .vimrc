" setting
set fenc=utf-8
set nobackup
set noswapfile
set nocompatible
set wildmenu
set autoread
set hidden
set showcmd
set virtualedit=onemore,block
set backspace=indent,eol,start
filetype plugin on

" 見た目
set t_Co=256
colorscheme molokai
hi VisualNOS ctermbg=242
hi Visual ctermbg=242
hi Normal ctermbg=none
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
set number
set ruler
set cursorline
set showmatch
set laststatus=2
set wildmode=list:longest
syntax on
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup end
set whichwrap=b,s,h,l,<,>,[,]
set foldmethod=manual
set statusline=%f%m%r%h%w\ [%l]\ [%{&ff}]\ [%{&fileencoding}]\ [%p%%]\ %y
let g:netrw_altv=1
let g:netrw_liststyle=1
let g:netrw_banner=0
let g:netrw_sizestyle="h"
let g:netrw_timefmt="%y/%m/%d(%a) %h:%m:%s"
let g:netrw_preview=1
set wrap
set linebreak

"tab系
set smartindent
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

"検索系
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <esc><esc> :nohlsearch<cr><esc>

set undodir=~/.vim/undodir
set undofile
set undolevels=1000

if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_si .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_ei .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_sr .= "\e[4 q"
endif

let mapleader = "\<space>"

" normal mode mapping
nnoremap x "_x
nnoremap X "_X
nnoremap U <c-r>
nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap H 10h
nnoremap J 10j
nnoremap K 10k
nnoremap L 10l
nnoremap <c-a> 0
nnoremap <c-e> $
nnoremap <c-s> :w<CR>
nnoremap <CR> A<Return><Esc>
nnoremap ee :Ve<CR>
autocmd FileType netrw nnoremap <buffer> <C-e> :vert e <cfile><CR>
" visual mode mapping
vnoremap x "_x
vnoremap X "_x
vnoremap H 10h
vnoremap J 10j
vnoremap K 10k
vnoremap L 10l
vnoremap <c-a> 0
vnoremap <c-e> $
vnoremap v <c-v>
" insert mode mapping
inoremap jj <esc>
inoremap Jj <esc>
inoremap jJ <esc>
inoremap JJ <esc>
