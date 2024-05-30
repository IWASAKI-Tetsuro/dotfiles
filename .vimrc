let mapleader = "\<SPACE>"
set timeoutlen=400
filetype plugin on
syntax on

" normal mode mapping
nnoremap <c-p> /
nnoremap <c-n> :
nnoremap x "_x
nnoremap X "_X
nnoremap U <c-r>
nnoremap Y y$
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap e <Nop>
nnoremap es :new<CR>
nnoremap ev :vnew<CR>
nnoremap e- :new<CR>
nnoremap e\ :vnew<CR>
nnoremap eh <c-w>h
nnoremap ej <c-w>j
nnoremap ek <c-w>k
nnoremap el <c-w>l
nnoremap ep gT
nnoremap en gt
nnoremap eo gt
nnoremap et :tabnew<CR>:E<CR>
nnoremap <silent>H 5h
nnoremap <silent>J 10j
nnoremap <silent>K 10k
nnoremap <silent>L 5l
nnoremap <c-a> 0
nnoremap <c-e> $
nnoremap <CR> A<Return><Esc>
nnoremap <silent>ee :call ToggleNetrw()<CR>
nnoremap > 5<c-w>>
nnoremap < 5<c-w><
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <BS> "_X
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap ; :
nnoremap m ;
nnoremap M ,
nnoremap <Leader><space> za
nnoremap <Leader>d zd
nnoremap <Leader>D zE
nnoremap <Leader>a zR
nnoremap gf :tabedit <cfile><CR>

" visual mode mapping
vnoremap x "_x
vnoremap X "_X
vnoremap H 5h
vnoremap J 10j
vnoremap K 10k
vnoremap L 5l
vnoremap <silent> j gj
vnoremap <silent> k gk
vnoremap <c-a> 0
vnoremap <c-e> $
vnoremap v <c-v>
vnoremap <BS> "_X
vnoremap <space> zf

" insert mode mapping
inoremap jj <esc>
inoremap Jj <esc>
inoremap jJ <esc>
inoremap JJ <esc>

" command line mode mapping
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-d> <Del>
cnoremap jj <C-c>
cnoremap Jj <C-c>
cnoremap jJ <C-c>
cnoremap JJ <C-c>
cnoremap qw wq
command! Wq wq
command! Qw wq
command! WQ wq

" Setting
set encoding=utf-8
scriptencoding encoding=utf-8
set fileencodings=utf-8
set notitle
set nobackup
set noswapfile
set nocompatible
set scrolloff=2
set wildmenu
set autoread
set hidden
set modeline
set showmode
set showcmd
set virtualedit=onemore,block
set backspace=indent,eol,start

" Undo
let undodir = expand('~/.vim/undodir')
if !isdirectory(undodir)
  call mkdir(undodir, 'p')
endif
let &undodir = undodir
set undofile
set undolevels=1000

" Folding
set foldlevelstart=0
set foldcolumn=1
" Save fold settings.
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif

"autocmd VimEnter * if &diff | windo setlocal foldmethod=manual

" don't save options.
set viewoptions-=options
set foldmethod=manual

" Appearance
" " cursor shape
if has('vim_starting')
  let &t_SI .= "\e[6 q"
  let &t_EI .= "\e[2 q"
endif

set number
set ruler
set cursorline
set showmatch
set laststatus=2
set wildmode=full
set vb t_vb=

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

set whichwrap=b,s,h,l,<,>,[,]
set statusline=%m%r%h%w\ [%l/%L]\ %y\ %F
set wrap
set linebreak

" Netrw
set splitbelow
set splitright
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_keepdir=1
let g:netrw_winsize=50
let g:netrw_browse_split=0
let g:netrw_bufsettings='noma nomod number nobl nowrap ro'
let g:netrw_dirhistmax=0
let g:netrw_followsymlink=1
let g:netrw_mousemaps=1
let g:netrw_sort_sequence='[\/]$,*'
let g:netrw_sort_options='i'
let g:netrw_fastbrows=0
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"

let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
      let i = bufnr("$")
      while (i >= 1)
          if (getbufvar(i, "&filetype") == "netrw")
              silent exe "bwipeout" . i
          endif
          let i-=1
      endwhile
      let g:NetrwIsOpen=0
    else
      let g:NetrwIsOpen=1
      silent Vex
    endif
endfunction

" Tab
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" Search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
noremap <esc><esc> :nohlsearch<cr><esc>

" Command line window
set cmdwinheight=20
" mouse
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

" Auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=manual
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" Color scheme
set t_Co=256
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

hi Normal               ctermfg=252 ctermbg=NONE
hi Comment              ctermfg=244
hi Constant             ctermfg=99
hi Statement            ctermfg=197               cterm=BOLD
hi String               ctermfg=228               cterm=BOLD
hi Character            ctermfg=99
hi Identifier           ctermfg=208
hi Type                 ctermfg=81
hi Title                ctermfg=228
hi Preproc              ctermfg=81
hi Special              ctermfg=81
hi Directory            ctermfg=14
hi Question             ctermfg=46
hi markdownLinkText     ctermfg=228
hi markdownItalic                                 cterm=NONE
hi markdownItalic                                 cterm=ITALIC

hi Cursor                            ctermbg=240
hi CursorLine                        ctermbg=238  cterm=NONE
hi LineNr               ctermfg=252  ctermbg=238
hi CursorLineNr         ctermfg=238  ctermbg=250  cterm=NONE
hi Visual                            ctermbg=238  cterm=NONE
hi Search               ctermfg=238  ctermbg=210
hi IncSearch            ctermfg=238  ctermbg=210  cterm=NONE
hi MatchParen           ctermfg=233  ctermbg=208  cterm=BOLD

hi StatusLine           ctermfg=156  ctermbg=238
hi StatusLineNC         ctermfg=238  ctermbg=250
hi TabLineSel           ctermfg=238  ctermbg=156
hi TabLineFill          ctermfg=238  ctermbg=252
hi TabLine              ctermfg=252  ctermbg=238
hi ModeMsg              ctermfg=11
hi ErrorMsg             ctermfg=9    ctermbg=NONE
hi WarningMsg           ctermfg=9    ctermbg=NONE

hi DiffAdd                           ctermbg=24
hi DiffChange           ctermfg=181  ctermbg=239
hi DiffDelete           ctermfg=162  ctermbg=53
hi DiffText                          ctermbg=102  cterm=BOLD

hi FoldColumn           ctermfg=81   ctermbg=238
hi Folded               ctermfg=81   ctermbg=NONE

hi netrwDir             ctermfg=81   ctermbg=NONE
hi netrwClassify        ctermfg=250  ctermbg=NONE
hi netrwLink            ctermfg=156  ctermbg=NONE
hi netrwTreebar         ctermfg=242  ctermbg=NONE
hi netrwSymLink         ctermfg=208  ctermbg=NONE
hi netrwExe             ctermfg=99   ctermbg=NONE

" To get the syntax ID
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()

" Highlighting trailing and leading spaces
augroup HighlightSpaces
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter,ColorScheme * highlight Spaces cterm=underline ctermfg=244
  autocmd VimEnter,WinEnter,BufWinEnter * match Spaces /^\s\+\|\s\+$/
augroup END

