let mapleader = "\<SPACE>"
se timeoutlen=400
filetype plugin indent on
syntax on

nn x "_x
nn X "_X
nn dh ^_d$
nn s "_s
nn S "_S
nn U <c-r>
nn Y y$
nn <silent>j gj
nn <silent>k gk
nn e <Nop>
nn ev :<c-u>vne<CR><c-w>l:E<CR>
nn es :<c-u>new<CR><c-w>:E<CR>
nn e <nop>
nn <silent>ed :bd<CR>
nn eh <c-w>h
nn ej <c-w>j
nn ek <c-w>k
nn el <c-w>l
nn <silent><Tab> :bn<CR>
nn <silent><S-Tab> :bp<CR>
nn <silent>H 5h
nn <silent>J 10gj
nn <silent>K 10gk
nn <silent>L 5l
nn <silent>ep :bro ol<CR>
nn <silent>ee :cal ToggleNetrw()<CR>
nn <Leader>s :cal Savereg()<CR>
nn <Leader>l :cal Loadreg()<CR>
nn <BS> "_X
nn n nzzzv
nn N Nzzzv
nn p ]p`]
nn P ]P`]
nn ; :
nn t ;
nn T ,
nn <Leader><space> za
nn <Leader>d zd
nn <Leader>D zE
nn <expr> i empty(getline('.')) ? '"_cc' : 'i'
nn <expr> A empty(getline('.')) ? '"_cc' : 'A'nn <Leader>a zR

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
vn <silent>j gj
vn <silent>k gk
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
vn > >gv
vn / y/<C-r>"<CR>
vn ? y?<C-r>"<CR>
vn <BS> "_X
vn <space> zf
vn <c-a> <Home>
vn <c-e> <End>
vn <c-p> <Up>
vn <c-n> <Down>

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
com! Wq wq
com! Qw wq
com! WQ wq
com! DiffOrig vne | se bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
com! Reload source ~/.vimrc

xn y mzy`z
xn p P
xn i<space> iW
xn a<space> aW
ono i<space> iW
ono a<space> aW

se enc=utf-8
se fenc=utf-8
se nobk
se noswapfile
se nocp
se so=2
se wmnu
se ar
se hid
se modeline
se smd
se sc
se ve=onemore,block
se backspace=indent,eol,start
se viminfo='10,\"1000
se cot=menuone,noselect
se acd

let undodir = expand('~/.vim/undodir')
if !isdirectory(undodir)
  cal mkdir(undodir, 'p')
en
let &undodir = undodir
se udf
se ul=1000

se foldlevelstart=0
se foldcolumn=1

se viewoptions-=options
se foldmethod=manual

if &term =~ 'screen' || &term =~ 'tmux'
  let &t_SI = "\ePtmux;\e\e[6 q\e\\"
  let &t_EI = "\ePtmux;\e\e[1 q\e\\"
  let &t_SR = "\ePtmux;\e\e[4 q\e\\"
el
  let &t_SI = "\e[6 q"
  let &t_EI = "\e[1 q"
  let &t_SR = "\e[4 q"
en

se number
se ruler
se cursorline
se showmatch
se tabline=%!BufferTabLine()
se showtabline=2
se laststatus=2
se wim=full
se wic
se vb t_vb=

aug vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | en
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
let g:netrw_keepdir=0
let g:netrw_winsize=20
let g:netrw_browse_split=4
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
fu ToggleNetrw()
    if g:NetrwIsOpen
      let i = bufnr("$")
      while (i >= 1)
          if (getbufvar(i, "&filetype") == "netrw")
              silent exe "bw" . i
          endif
          let i-=1
      endwhile
      let g:NetrwIsOpen=0
    else
      let g:NetrwIsOpen=1
      silent Vex
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
    elsei v:version > 703 || v:version is 703 && has('patch632')
        se ttymouse=sgr
    el
        se ttymouse=xterm2
    en
en

" Auto reload .vimrc
aug source-vimrc
  au!
  au BufWritePost *vimrc source $MYVIMRC | se foldmethod=manual
  au BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
aug END

" Color scheme
se t_Co=256
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
hi WinSeparator     ctermfg=252  ctermbg=238                 
hi VertSplit        ctermfg=238  ctermbg=252                 
                                                             
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

aug HighlightSpaces
  au!
  au VimEnter,WinEnter,BufWinEnter,ColorScheme * highlight Spaces cterm=underline ctermfg=244 ctermfg=244 gui=underline guifg=#FFFFFF
  au VimEnter,WinEnter,BufWinEnter * match Spaces /^\s\+\|\s\+$/
aug END  

let s:vimreg = expand('~/.vim/vimreg')
fu Savereg() abort
  cal writefile([json_encode(getreginfo())], s:vimreg)
  ec 'Save register'
endf
fu Loadreg() abort
  cal setreg(v:register, readfile(s:vimreg)->join()->json_decode())
  ec 'Restore register'
endf

fu! BufferTabLine()
  let buffer_tabline = ''
  let s:buffer_info = s:GetBufferName()
  for i in s:buffer_info
    if i[3] == 1
      let buffer_tabline = buffer_tabline . '%#TabLineSel#'
    el
      let buffer_tabline = buffer_tabline . '%#TabLine#'
    en
  
    let buffer_tabline = buffer_tabline . i[0] . ':' . i[1] . ' '
  
    if i[2] == 1
      let buffer_tabline = buffer_tabline . ' +'
    en
  
  endfo

  let buffer_tabline = buffer_tabline . '%#TabLineFill#%T'
  let buffer_tabline = buffer_tabline . '%='
  retu buffer_tabline
endf

fu! s:GetBufferName()
  redi => s:buffers
    silent ls
  redi END
  let s:result = []
  let s:buffer_list = split(s:buffers, "\n")
  for b in s:buffer_list
    let s:buffer_line = split(b)
    let s:buffer_num = s:buffer_line[0]
    let s:buffer_name = ''
    let s:current_buffer = 0
    let s:edit_flag = 0
    let s:unmodifiable = 0
    
    for i in s:buffer_line
      if i == '%a'
        let s:current_buffer = 1
      elsei i == '+'
        let s:edit_flag = 1
      elsei i == 'a-' || i == '%a-'
        let s:unmodifiable = 1
      elsei i[0] == '"'
        let s:path = substitute(i, '"', '', 'g')
        let s:name_path = split(s:path, '/')
        let s:buffer_name = s:name_path[len(s:name_path) - 1]
      el
      en
    endfo

    if s:unmodifiable != 1
      let s:result = add(s:result, [s:buffer_num, s:buffer_name, s:edit_flag, s:current_buffer])
    en
  endfo
  retu s:result
endf

