let mapleader = "\<SPACE>"
se timeoutlen=400
filetype plugin indent on
syntax on
" normal mode mapping
nn x "_x
nn X "_X
nn s "_s
nn S "_S
nn U <c-r>
nn Y y$
nn <silent> j gj
nn <silent> k gk
nn e <Nop>
nn ev :<c-u>vnew<CR><c-w>l:E<CR>
nn e <nop>
nn eh <c-w>h
nn ej <c-w>j
nn ek <c-w>k
nn el <c-w>l
nn <Tab> gt
nn <S-Tab> gT
nn <silent>H 5h
nn <silent>J 10j
nn <silent>K 10k
nn <silent>L 5l
nn <silent>ee :call ToggleNetrw()<CR>
nn <silent>et :tabnew<CR>:E<CR>
nn <Leader>s :call Savereg()<CR>
nn <Leader>l :call Loadreg()<CR>
nn <BS> "_X
nn n nzzzv
nn N Nzzzv
nn [q :cprevious<CR>
nn ]q :cnext<CR>
nn ; :
nn t ;
nn T ,
nn <Leader><space> za
nn <Leader>d zd
nn <Leader>D zE
nn <Leader>a zR
nn gf :tabedit <cfile><CR>
nn gv :vnew <cfile><CR>
nn ep :call ShowMostRecentlyClosedTabs()<CR>

" visual mode mapping
vn x "_x
vn X "_X
vn s "_s
vn S "_S
vn H 5h
vn J 10j
vn K 10k
vn L 5l
vn t ;
vn T ,
vn <silent> j gj
vn <silent> k gk
vn <c-a> 0
vn <c-e> $
vn v <c-v>
vn ( di()<Esc>P<Left>%
vn [ di[]<Esc>P<Left>%
vn { di{}<Esc>P<Left>%
vn ) di()<Esc>P<Left>%
vn ] di[]<Esc>P<Left>%
vn } di{}<Esc>P<Left>%
vn < di<><Esc>P<Left>%
vn / y/<C-r>"<CR>
vn ? y?<C-r>"<CR>
vn <BS> "_X
vn <space> zf
vn <c-a> <Home>
vn <c-e> <End>
vn <c-p> <Up>
vn <c-n> <Down>

" insert mode mapping
ino jj <esc>
ino Jj <esc>
ino jJ <esc>
ino JJ <esc>
ino <c-a> <Home>
ino <c-e> <End>
ino <c-b> <Left>
ino <c-f> <Right>
ino <c-d> <Del>
ino <c-]> <Esc><right>

" command line mode mapping
cno <c-a> <Home>
cno <c-e> <End>
cno <c-p> <Up>
cno <c-n> <Down>
cno <c-b> <Left>
cno <c-f> <Right>
cno <c-d> <Del>
cno <c-u> <c-c>:
cno jj <C-c>
cno jk <C-c>
cno Jj <C-c>
cno jJ <C-c>
cno JJ <C-c>
cno qw wq
command! Wq wq
command! Qw wq
command! WQ wq
command! DiffOrig vnew | se bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

xn y mzy`z
xn p P

" Setting
se encoding=utf-8
scriptencoding encoding=utf-8
se fileencodings=utf-8
se notitle
se nobackup
se noswapfile
se nocompatible
se scrolloff=2
se wildmenu
se autoread
se hidden
se modeline
se showmode
se showcmd
se virtualedit=onemore,block
se backspace=indent,eol,start
se viminfo='20,\"1000
se completeopt=menuone,noselect

" Undo
let undodir = expand('~/.vim/undodir')
if !isdirectory(undodir)
  call mkdir(undodir, 'p')
endif
let &undodir = undodir
se undofile
se undolevels=1000

" Folding
se foldlevelstart=0
se foldcolumn=1

"au VimEnter * if &diff | windo setlocal foldmethod=manual

" don't save options.
se viewoptions-=options
se foldmethod=manual

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

se number
se ruler
se nolist
se cursorline
se showmatch
se showtabline=2
se laststatus=2
se wildmode=full
se vb t_vb=

aug vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
aug END

se whichwrap=b,s,h,l,<,>,[,]
" set shortmess+=I
se statusline=%m%r%h%w\ [%l/%L]\ %y\ %F
se wrap
se linebreak

" Netrw
se splitbelow
se splitright
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
fu! ToggleNetrw()
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
endfu

" Tab
ino <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
se expandtab
se tabstop=2
se shiftwidth=2
se softtabstop=2
se autoindent
se smartindent

" Search
se ignorecase
se smartcase
se incsearch
se wrapscan
se hlsearch
no <silent> <esc><esc> :nohlsearch<cr><esc>:diffoff<cr><esc>

" Command line window
se cmdwinheight=20
" mouse
if has('mouse')
    se mouse=a
    if has('mouse_sgr')
        se ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        se ttymouse=sgr
    else
        se ttymouse=xterm2
    endif
endif

" Auto reload .vimrc
aug source-vimrc
  au!
  au BufWritePost *vimrc source $MYVIMRC | se foldmethod=manual
  au BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
aug END

" Color scheme
se t_Co=256
se termguicolors
se notermguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

se bg=dark
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
hi LineNr           ctermfg=252  ctermbg=238                  
hi CursorLine                    ctermbg=238  cterm=NONE      
hi CursorLineNr     ctermfg=238  ctermbg=250  cterm=NONE      
hi Visual                        ctermbg=238  cterm=NONE      
hi Search           ctermfg=212  ctermbg=236  cterm=UNDERLINE 
hi incsearch        ctermfg=212  ctermbg=236  cterm=UNDERLINE 
hi matchparen       ctermfg=212  ctermbg=NONE cterm=UNDERLINE 
hi Pmenu                         ctermbg=238  cterm=NONE      
hi PmenuSel         ctermfg=252   ctermbg=240  cterm=NONE      
                                                              
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
" To get the syntax ID
fu! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfu
fu! s:get_syn_attr(synid)
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
endfu
fu! s:get_syn_info()
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
endfu
command! SyntaxInfo call s:get_syn_info()

" Highlighting trailing and leading spaces
aug HighlightSpaces
  au!
  au VimEnter,WinEnter,BufWinEnter,ColorScheme * highlight Spaces cterm=underline ctermfg=244 ctermfg=244 gui=underline guifg=#FFFFFF
  au VimEnter,WinEnter,BufWinEnter * match Spaces /^\s\+\|\s\+$/
aug END   

fu! OpenQuickfixWindow()
  tabnew
  copen
  se modifiable
  resize 15
endfu
au FileType qf wincmd J
au QuickfixCmdPost vimgrep call OpenQuickfixWindow()

let s:vimreg = expand('~/.vim/vimreg')
fu Savereg() abort
  call writefile([json_encode(getreginfo())], s:vimreg)
  echo 'Save register'
endfu
fu Loadreg() abort
  call setreg(v:register, readfile(s:vimreg)->join()->json_decode())
  echo 'Restore register'
endfu

let s:vimhis = expand('~/.vim/vimhis')
let g:most_recently_closed = readfile(s:vimhis)

aug MostRecentlyClosedTabs
  au!
  au BufWinLeave * if (expand('<amatch>') != '' && expand('<amatch>') !~ 'Netrw') | call insert(g:most_recently_closed, expand('<amatch>')) | endif
aug END

au VimLeave * call writefile(g:most_recently_closed, s:vimhis)

fu! ShowMostRecentlyClosedTabs() abort
  10new
  se bufhidden=hide
  call append(0, g:most_recently_closed)
  $delete
  au WinClosed <buffer> bwipeout!
  nn <buffer> q :bwipeout!<CR>o  nn <buffer> <ESC> :bwipeout!<CR>
  nn <buffer> ep :bwipeout!<CR> :let winID = win_vimhis_getid()<CR>
  nn <buffer> dd :call remove(g:most_recently_closed, line('.') - 1)<CR>:delete<CR>
  nn <buffer> <CR> :execute 'tabnew ' .. g:most_recently_closed[line('.')-1]<CR>:let winID = win_getid()<CR>
endfu

