let mapleader = "\<SPACE>"
set timeoutlen=400
filetype plugin on
" normal mode mapping
nnoremap x "_x
nnoremap X "_X
nnoremap U <c-r>
nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap <Leader>h <c-w>h
nnoremap <Leader>H <c-w>h
nnoremap <Leader>j <c-w>j
nnoremap <Leader>J <c-w>j
nnoremap <Leader>k <c-w>k
nnoremap <Leader>K <c-w>k
nnoremap <Leader>l <c-w>l
nnoremap <Leader>L <c-w>l
nnoremap <Leader>v <c-w>v
nnoremap H 5h
nnoremap J 10j
nnoremap K 10k
nnoremap L 5l
nnoremap <c-a> 0
nnoremap <c-e> $
nnoremap <c-s> :w<CR>
nnoremap <c-i> <c-a>
nnoremap <c-d> <c-x>
nnoremap <CR> A<Return><Esc>
nnoremap <silent>ee :call ToggleNetrw()<CR>
nnoremap > 5<c-w>>
nnoremap < 5<c-w><
nnoremap <Tab> %
nnoremap <BS> "_X
" visual mode mapping
vnoremap x "_x
vnoremap X "_X
vnoremap H 5h
vnoremap J 10j
vnoremap K 10k
vnoremap L 5l
vnoremap <c-a> 0
vnoremap <c-e> $
vnoremap v <c-v>
vnoremap <BS> "_X
" insert mode mapping
inoremap jj <esc>
inoremap Jj <esc>
inoremap jJ <esc>
inoremap JJ <esc>
" command line mode mapping
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
command! Wq wq
command! WQ wq
command! Q q

" setting
set fenc=utf-8
set notitle
set nobackup
set noswapfile
set nocompatible
set belloff=all
set scrolloff=2
set wildmenu
set autoread
set hidden
set modeline
set showmode
set showcmd
set virtualedit=onemore,block
set backspace=indent,eol,start

" undo
let undodir = expand('~/.vim/undodir')
if !isdirectory(undodir)
    call mkdir(undodir, 'p')
endif
set undodir=undodir
set undofile
set undolevels=1000

" appearance
" " cursor shape
if has('vim_starting')
  let &t_SI .= "\e[6 q"
  let &t_EI .= "\e[2 q"
  let &t_SR .= "\e[4 q"
endif

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=#808080 ctermbg=242
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

set number
set ruler
set cursorline
set showmatch
set laststatus=2
set listchars=tab:>\ ,extends:<
set wildmode=list:longest

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup end

set whichwrap=b,s,h,l,<,>,[,]
set foldmethod=manual
set statusline=%f%m%r%h%w\ [%l/%L]\ [%{&ff}]\ [%{&fileencoding}]\ %y
set wrap
set linebreak

" netrw
set splitright
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_keepdir=0
let g:netrw_winsize=25
let g:netrw_browse_split=4
let g:netrw_bufsettings='noma nomod number nobl nowrap ro'

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

" tab
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
noremap <esc><esc> :nohlsearch<cr><esc>

" command line window
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

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

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


" " color scheme
set t_Co=256

hi Normal               ctermfg=252  ctermbg=none

hi Comment              ctermfg=240
hi Constant             ctermfg=99
hi Statement            ctermfg=209  cterm=bold
hi String               ctermfg=228  cterm=bold
hi Character            ctermfg=99
hi Identifier           ctermfg=156
hi Type                 ctermfg=81
hi Title                ctermfg=228
hi Preproc              ctermfg=81
hi Special              ctermfg=81
hi Directory            ctermfg=14
hi Question             ctermfg=46
hi markdownLinkText     ctermfg=228

hi Cursor               ctermbg=244
hi CursorLine           cterm=NONE
hi CursorLine           ctermbg=238
hi LineNr               ctermfg=252 ctermbg=238
hi CursorLineNr         cterm=NONE
hi CursorLineNr         ctermfg=238 ctermbg=250
hi Visual               cterm=NONE  ctermbg=238
hi Search               ctermbg=244
hi IncSearch            cterm=NONE  ctermbg=244
hi MatchParen           ctermfg=252 ctermbg=210

hi StatusLine           ctermfg=238 ctermbg=255
hi ModeMsg              ctermfg=11
hi ErrorMsg             ctermfg=9   ctermbg=NONE
hi WarningMsg           ctermfg=9   ctermbg=NONE
