let mapleader = "\<SPACE>"
set timeoutlen=400
filetype plugin indent on
syntax on
" normal mode mapping
nnoremap x "_x
nnoremap X "_X
nnoremap U <c-r>
nnoremap Y y$
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap e <Nop>
nnoremap ev :<c-u>vnew<CR><c-w>l:E<CR>
nnoremap e <nop>
nnoremap eh <c-w>h
nnoremap ej <c-w>j
nnoremap ek <c-w>k
nnoremap el <c-w>l
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent>H 5h
nnoremap <silent>J 10j
nnoremap <silent>K 10k
nnoremap <silent>L 5l
nnoremap <silent>ee :call ToggleNetrw()<CR>
nnoremap <silent>et :tabnew<CR>:E<CR>
nnoremap <Leader>s :call Savereg()<CR>
nnoremap <Leader>l :call Loadreg()<CR>
nnoremap <BS> "_X
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap ; :
nnoremap t ;
nnoremap T ,
nnoremap <Leader><space> za
nnoremap <Leader>d zd
nnoremap <Leader>D zE
nnoremap <Leader>a zR
nnoremap gf :tabedit <cfile><CR>
nnoremap gv :vnew <cfile><CR>
" nnoremap <c-a> 0
nnoremap <c-e> $
nnoremap ep :call ShowMostRecentlyClosedTabs()<CR>

" visual mode mapping
vnoremap x "_x
vnoremap X "_X
vnoremap H 5h
vnoremap J 10j
vnoremap K 10k
vnoremap L 5l
vnoremap t ;
vnoremap T ,
vnoremap <silent> j gj
vnoremap <silent> k gk
vnoremap <c-a> 0
vnoremap <c-e> $
vnoremap v <c-v>
vnoremap ( di()<Esc>P<Left>%
vnoremap [ di[]<Esc>P<Left>%
vnoremap { di{}<Esc>P<Left>%
vnoremap ) di()<Esc>P<Left>%
vnoremap ] di[]<Esc>P<Left>%
vnoremap } di{}<Esc>P<Left>%
vnoremap < di<><Esc>P<Left>%
vnoremap / y/<C-r>"<CR>
vnoremap ? y?<C-r>"<CR>
vnoremap <BS> "_X
vnoremap <space> zf
vnoremap <c-a> <Home>
vnoremap <c-e> <End>
vnoremap <c-p> <Up>
vnoremap <c-n> <Down>

" insert mode mapping
inoremap jj <esc>
inoremap Jj <esc>
inoremap jJ <esc>
inoremap JJ <esc>
inoremap <c-a> <Home>
inoremap <c-e> <End>
inoremap <c-b> <Left>
inoremap <c-f> <Right>
inoremap <c-d> <Del>

" command line mode mapping
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-d> <Del>
cnoremap <c-u> <c-c>:
cnoremap jj <C-c>
cnoremap jk <C-c>
cnoremap Jj <C-c>
cnoremap jJ <C-c>
cnoremap JJ <C-c>
cnoremap qw wq
command! Wq wq
command! Qw wq
command! WQ wq
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

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
set viminfo='20,\"1000

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

"autocmd VimEnter * if &diff | windo setlocal foldmethod=manual

" don't save options.
set viewoptions-=options
set foldmethod=manual

" Appearance
" " cursor shape
if &term =~ 'screen' || &term =~ 'tmux'
  let &t_SI = "\ePtmux;\e\e[6 q\e\\"
  let &t_EI = "\ePtmux;\e\e[1 q\e\\"
  let &t_SR = "\ePtmux;\e\e[4 q\e\\"
else
  let &t_SI = "\e[6 q"
  let &t_EI = "\e[1 q"
  let &t_SR = "\e[4 q"
endif

set number
set ruler
set nolist
set cursorline
set showmatch
set showtabline=2
set laststatus=2
set wildmode=full
set vb t_vb=

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

set whichwrap=b,s,h,l,<,>,[,]
" set shortmess+=I
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
let g:netrw_sizestyle="H"

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
      silent Vex 25
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
noremap <silent> <esc><esc> :nohlsearch<cr><esc>:diffoff<cr><esc>

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
set termguicolors
set notermguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set bg=dark
if &termguicolors
  hi Normal           guifg=#        guibg=#                      
  hi Comment          guifg=#                                     
  hi Constant         guifg=#                                     
  hi Statement        guifg=#                        gui=BOLD     
  hi String           guifg=#                        gui=BOLD     
  hi Character        guifg=#                                     
  hi Identifier       guifg=#                                     
  hi Type             guifg=#                                     
  hi Title            guifg=#                                     
  hi Preproc          guifg=#                                     
  hi Special          guifg=#                                     
  hi Directory        guifg=#                                     
  hi Question         guifg=#                                     
  hi markdownLinkText guifg=#                                     
  hi markdownItalic                                  gui=NONE     
  hi markdownItalic                                  gui=ITALIC   
                                                                  
  hi Cursor                          guibg=#                      
  hi CursorLine                      guibg=#         gui=NONE     
  hi LineNr           guifg=#        guibg=#                      
  hi CursorLineNr     guifg=#        guibg=#         gui=NONE     
  hi Visual                          guibg=#         gui=NONE     
  hi Search           guifg=#        guibg=#         gui=UNDERLINE
  hi incsearch        guifg=#        guibg=#         gui=UNDERLINE
  hi matchparen       guifg=#        guibg=#         gui=UNDERLINE
                                                                  
  hi statusline       guifg=#        guibg=#                      
  hi statuslinenc     guifg=#        guibg=#                      
  hi tablinesel       guifg=#        guibg=#                      
  hi tablinefill      guifg=#        guibg=#                      
  hi tabline          guifg=#        guibg=#                      
  hi ModeMsg          guifg=#                                     
  hi ErrorMsg         guifg=#        guibg=#                      
  hi WarningMsg       guifg=#        guibg=#                      
                                                                  
  hi DiffAdd                         guibg=#                      
  hi DiffDelete       guifg=#        guibg=#                      
  hi DiffChange                      guibg=#                      
  hi DiffText         guifg=#        guibg=#         gui=BOLD     
                                                                  
  hi FoldColumn       guifg=#        guibg=#                      
  hi Folded           guifg=#        guibg=#                      
                                                                  
  hi netrwDir         guifg=#        guibg=#                      
  hi netrwClassify    guifg=#        guibg=#                      
  hi netrwLink        guifg=#        guibg=#                      
  hi netrwTreebar     guifg=#        guibg=#                      
  hi netrwSymLink     guifg=#        guibg=#                      
  hi netrwExe         guifg=#        guibg=#                      
else
  hi Normal           ctermfg=252 ctermbg=NONE                  
  hi Comment          ctermfg=244                               
  hi Constant         ctermfg=99                                
  hi Statement        ctermfg=197               cterm=BOLD      
  hi String           ctermfg=228               cterm=BOLD      
  hi Character        ctermfg=99                                
  hi Identifier       ctermfg=208                               
  hi Type             ctermfg=81                                
  hi Title            ctermfg=228                               
  hi Preproc          ctermfg=81                                
  hi Special          ctermfg=81                                
  hi Directory        ctermfg=14                                
  hi Question         ctermfg=46                                
  hi markdownLinkText ctermfg=228                               
  hi markdownItalic                             cterm=NONE      
  hi markdownItalic                             cterm=ITALIC    
                                                                
  hi Cursor                        ctermbg=240                  
  hi CursorLine                    ctermbg=238  cterm=NONE      
  hi LineNr           ctermfg=252  ctermbg=238                  
  hi CursorLineNr     ctermfg=238  ctermbg=250  cterm=NONE      
  hi Visual                        ctermbg=238  cterm=NONE      
  hi Search           ctermfg=212  ctermbg=236  cterm=UNDERLINE 
  hi incsearch        ctermfg=212  ctermbg=236  cterm=UNDERLINE 
  hi matchparen       ctermfg=212  ctermbg=NONE cterm=UNDERLINE 
  hi Pmenu                         ctermbg=238
  hi PmenuSel         ctermfg=252  ctermbg=197
                                                                
  hi statusline       ctermfg=156  ctermbg=238                  
  hi statuslinenc     ctermfg=238  ctermbg=250                  
  hi tablinesel       ctermfg=238  ctermbg=156                  
  hi tablinefill      ctermfg=238  ctermbg=252                  
  hi tabline          ctermfg=252  ctermbg=238                  
  hi ModeMsg          ctermfg=11                                
  hi ErrorMsg         ctermfg=9    ctermbg=NONE                 
  hi WarningMsg       ctermfg=9    ctermbg=NONE                 
                                                                
  hi DiffAdd                       ctermbg=24                   
  hi DiffDelete       ctermfg=162  ctermbg=53                   
  hi DiffChange                    ctermbg=236                  
  hi DiffText         ctermfg=210  ctermbg=236   cterm=BOLD     
                                                                
  hi FoldColumn       ctermfg=81   ctermbg=238                  
  hi Folded           ctermfg=81   ctermbg=NONE                 
                                                                
  hi netrwDir         ctermfg=81   ctermbg=NONE                 
  hi netrwClassify    ctermfg=250  ctermbg=NONE                 
  hi netrwLink        ctermfg=156  ctermbg=NONE                 
  hi netrwTreebar     ctermfg=242  ctermbg=NONE                 
  hi netrwSymLink     ctermfg=208  ctermbg=NONE                 
  hi netrwExe         ctermfg=99   ctermbg=NONE                 
endif
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
  autocmd VimEnter,WinEnter,BufWinEnter,ColorScheme * highlight Spaces cterm=underline ctermfg=244 ctermfg=244 gui=underline guifg=#FFFFFF
  autocmd VimEnter,WinEnter,BufWinEnter * match Spaces /^\s\+\|\s\+$/
augroup END   

function! OpenQuickfixWindow()
  tabnew
  copen
  set modifiable
  resize 15
endfunction
autocmd FileType qf wincmd J
autocmd QuickfixCmdPost vimgrep call OpenQuickfixWindow()

let s:vimreg = expand('~/.vim/vimreg')
function Savereg() abort
  call writefile([json_encode(getreginfo())], s:vimreg)
  echo 'Save register'
endfunction
function Loadreg() abort
  call setreg(v:register, readfile(s:vimreg)->join()->json_decode())
  echo 'Restore register'
endfunction

let s:vimhis = expand('~/.vim/vimhis')
let g:most_recently_closed = readfile(s:vimhis)

augroup MostRecentlyClosedTabs
  autocmd!
  autocmd BufWinLeave * if (expand('<amatch>') != '' && expand('<amatch>') !~ 'Netrw') | call insert(g:most_recently_closed, expand('<amatch>')) | endif
augroup END

autocmd VimLeave * call writefile(g:most_recently_closed, s:vimhis)

function! ShowMostRecentlyClosedTabs() abort
  10new
  set bufhidden=hide
  call append(0, g:most_recently_closed)
  $delete
  autocmd WinClosed <buffer> bwipeout!
  nnoremap <buffer> q :bwipeout!<CR>
  nnoremap <buffer> <ESC> :bwipeout!<CR>
  nnoremap <buffer> ep :bwipeout!<CR>
  nnoremap <buffer> dd :call remove(g:most_recently_closed, line('.') - 1)<CR> :delete<CR>
  nnoremap <buffer> <CR> :execute 'tabnew ' .. g:most_recently_closed[line('.') - 1]<CR>
endfunction

