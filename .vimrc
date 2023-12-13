" setting
set fenc=urf-8
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
colorscheme molokai
hi VisualNOS ctermbg=242
hi Visual ctermbg=242
hi Normal ctermbg=none
set number
set ruler
set cursorline
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
syntax on
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
set whichwrap=b,s,h,l,<,>,[,]
set foldmethod=manual
set statusline=%f%m%r%h%w\ [%L]\ [%{&ff}]\ [%{&fileencoding}]\ [%p%%]\ %y
let g:netrw_altv=1
let g:netrw_liststyle=1
let g:netrw_banner=0
let g:netrw_sizestyle="H"
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_preview=1

"Tab系
set list listchars=tab:\▸\-
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
nmap <Esc><Esc> :nohlsearch<CR><Esc>
 
set t_Co=256
set wrap
set linebreak
set undodir=~/.vim/undodir
set undofile
set undolevels=1000

if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

let mapleader = "\<Space>"

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
vnoremap v <c-v>
" insert mode mapping
inoremap jj <esc>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
