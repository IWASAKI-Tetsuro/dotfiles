mapc!
au InsertLeave * set timeoutlen=1000
au InsertEnter * set timeoutlen=200
let mapleader="\<SPACE>"
filetype plugin indent on
syntax on

nn x "_x
nn X "_X
nn ds< di<"_X"_xP
nn ds( di("_X"_xP
nn ds[ di["_X"_xP
nn ds> di<"_X"_xP
nn ds) di("_X"_xP
nn ds] di["_X"_xP
nn ds" di""_X"_xP
nn ds' di'"_X"_xP
nn U <c-r>
nn Y y$
nn >j gj
nn <silent>k gk
nn s <Nop>
nn S <Nop>
nn sh <c-w>h
nn sj <c-w>j
nn sk <c-w>k
nn sl <c-w>l
nn sp :bro ol<CR>
nn gp :bro ol<CR>
nn <C-s> :cal ToggleNetrw()<CR>
nn ss :cal ToggleNetrw()<CR>
nn sc :cal ToggleQuickfix()<CR>
nn <silent>H 5h
nn <silent>J 10gj
nn <silent>K 10gk
nn <silent>L 5l
nn <Leader>s :cal Savereg()<CR>
nn <Leader>l :cal Loadreg()<CR>
nn <silent><Tab> :cal NextNonQuickfix()<CR>
nn <silent><S-Tab> :cal PrevNonQuickfix()<CR>
nn <BS> "_X
nn <BS> "_X
nn <CR> :call append(line("."), "")<CR><Down>
nn n nzzzv
nn N Nzzzv
nn p ]p
nn P ]P
nn ; :
nn t ;
nn T ,
nn <C-t> >>
nn <C-d> <<
nn <Leader><space> za
nn <Leader>d zd
nn <Leader>D zE
nn <expr> i empty(getline('.')) ? '"_cc' : 'i'
nn <expr> A empty(getline('.')) ? '"_cc' : 'A'nn <Leader>a zR
nn <C-c> :cal ToggleQuickfix()<CR>
nn <expr> <C-p> '<Cmd>CCycle -' .. v:count1 .. '<CR>'
nn <expr> <C-n> '<Cmd>CCycle '  .. v:count1 .. '<CR>'
nn <leader>cc :call ToggleLineComment()<CR>

vn x "_x
vn s <Nop>
vn S <Nop>
vn H 5h
vn J 10j
vn K 10k
vn L 5l
vn t ;
vn T ,
vn <silent>j gj
vn <silent>k gk
vn <c-e> $
vn v <c-v>
vn ( s(<c-r>")<Esc>
vn [ s[<c-r>"]<Esc>
vn { s{<c-r>"}<Esc>
vn < s<<c-r>"><Esc>
vn " s"<c-r>""<Esc>
vn ' s'<c-r>"'<Esc>
vn <C-t> >gv
vn <C-d> <gv
vn ; :
vn n nzzzv
vn N Nzzzv
vn <BS> "_X
vn <space> zf
vn <c-e> <End>
vn <c-p> <Up>
vn <c-n> <Down>
vn <leader>cc :<C-U>call ToggleComment()<CR>


ino jj <esc>
ino Jj <esc>
ino jJ <esc>
ino JJ <esc>

cno <c-a> <Home>
cno <c-e> <End>
cno <c-p> <Up>
cno <c-n> <Down>
cno <c-b> <Left>
cno <c-f> <Right>
cno <c-d> <Del>
cno jj <C-c>
cno Jj <C-c>
cno jJ <C-c>
cno JJ <C-c>
cno qw wq
com! Wq wq
com! Qw wq
com! WQ wq
com! DiffOrig vne | se bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
com! Reload so ~/.vimrc

xn y mzy`z
xn p P
xn i<space> iW
xn a<space> 2iW
ono i<space> iW
ono a<space> 2iW
xn s<space> iW
xn a" 2i"
xn a' 2i'
xn a` 2i`
ono a" 2i"
ono a' 2i'
ono a` 2i`

se enc=utf-8
se fenc=utf-8
se nobk
se noswf
se nocp
se so=2
se wmnu
se ar
se hid
se ml
se smd
se sc
se ve=onemore,block
se bs=indent,eol,start
se vi='10,\"1000
se cot=menuone,noselect
se pa=$PWD/**
se acd

let undodir=expand('~/.vim/undodir')
if !isdirectory(undodir)
  cal mkdir(undodir, 'p')
en
let &undodir=undodir
se udf
se ul=1000

se fdls=0
se fdc=1

se vop-=options
se fdm=manual

if &term=~'screen' || &term =~ 'tmux'
  let &t_SI="\ePtmux;\e\e[6 q\e\\"
  let &t_EI="\ePtmux;\e\e[1 q\e\\"
  let &t_SR="\ePtmux;\e\e[4 q\e\\"
el
  let &t_SI="\e[6 q"
  let &t_EI="\e[1 q"
  let &t_SR="\e[4 q"
en

se nu
se ru
se cul
se sm
se tal=%!BufferTabLine()
se stal=2
se ls=2
se wim=full
se wic
se vb t_vb=

se ww=b,s,h,l,<,>,[,]
" set shortmess+=I
se stl=%m%r%h%w\ [%l/%L]\ %y\ %F
se wrap
se lbr

se sb
se spr
" Tab
ino <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
se et
se ts=2
se sw=2
se sts=2
se ai
se si

" Search
se ic
se scs
se is
se ws
se hls
no <silent><esc><esc> :nohlsearch<cr><esc>:diffoff<cr><esc>

" Command line window
se cwh=20
" mouse
if has('mouse')
    se mouse=a
    if has('mouse_sgr')
        se ttym=sgr
    elsei v:version > 703 || v:version is 703 && has('patch632')
        se ttym=sgr
    el
        se ttym=xterm2
    en
en

" Color scheme
se t_Co=256
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

se bg=dark
hi Normal           ctermfg=252 ctermbg=NONE                 
hi NonText                      ctermbg=NONE                 
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
hi Visual           ctermfg=NONE ctermbg=238  cterm=NONE     
hi Search           ctermfg=212  ctermbg=236  cterm=UNDERLINE
hi incsearch        ctermfg=212  ctermbg=236  cterm=UNDERLINE
hi matchparen       ctermfg=212  ctermbg=NONE cterm=UNDERLINE
hi Pmenu                         ctermbg=238  cterm=NONE     
hi PmenuSel         ctermfg=252  ctermbg=240  cterm=NONE    
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

let s:vimreg=expand('~/.vim/vimreg')
fu! Savereg() abort
  cal writefile([json_encode(getreginfo())], s:vimreg)
  ec 'Save register'
endf
fu! Loadreg() abort
  cal setreg(v:register, readfile(s:vimreg)->join()->json_decode())
  ec 'Restore register'
endf

fu! BufferTabLine()
  let buffer_tabline=''
  let s:buffer_info=s:GetBufferName()
  for i in s:buffer_info
    if i[3] == 1
      let buffer_tabline=buffer_tabline . '%#TabLineSel#'
    el
      let buffer_tabline=buffer_tabline . '%#TabLine#'
    en
  
    let buffer_tabline=buffer_tabline . i[0] . ':' . i[1] . ' '
  
    if i[2] == 1
      let buffer_tabline=buffer_tabline . ' +'
    en
  
  endfo

  let buffer_tabline=buffer_tabline . '%#TabLineFill#%T'
  let buffer_tabline=buffer_tabline . '%='
  retu buffer_tabline
endf

fu! s:GetBufferName()
  redi => s:buffers
    silent ls
  redi END
  let s:result=[]
  let s:buffer_list=split(s:buffers, "\n")
  for b in s:buffer_list
    let s:buffer_line=split(b)
    let s:buffer_num=s:buffer_line[0]
    let s:buffer_name=''
    let s:current_buffer=0
    let s:edit_flag=0
    let s:unmodifiable=0
    
    for i in s:buffer_line
      if i == '%a'
        let s:current_buffer=1
      elsei i == '+'
        let s:edit_flag=1
      elsei i == 'a-' || i == '%a-'
        let s:unmodifiable=1
      elsei i[0] == '"'
        let s:path=substitute(i, '"', '', 'g')
        let s:name_path=split(s:path, '/')
        let s:buffer_name=s:name_path[len(s:name_path) - 1]
      el
      en
    endfo

    if s:unmodifiable != 1
      let s:result=add(s:result, [s:buffer_num, s:buffer_name, s:edit_flag, s:current_buffer])
    en
  endfo
  retu s:result
endf

if !exists('g:loaded_matchit')
  pa! matchit
en
aug MatchParenSettings
au FileType verilog let b:match_words = '\<begin\>:\<end\>'
au FileType systemverilog let b:match_words = '\<begin\>:\<end\>'
au FileType verilogams let b:match_words = '\<begin\>:\<end\>'
au FileType verilog syntax match verilogBlock /\<begin\>/ containedin=ALL
au FileType verilog syntax match verilogBlock /\<end\>/ containedin=ALL
au FileType systemverilog syntax match verilogBlock /\<begin\>/ containedin=ALL
au FileType systemverilog syntax match verilogBlock /\<end\>/ containedin=ALL
au FileType verilogams syntax match verilogBlock /\<begin\>/ containedin=ALL
au FileType verilogams syntax match verilogBlock /\<end\>/ containedin=ALL
aug END
hi link verilogBlock MatchParen


let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_keepdir=0
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
fu! ToggleNetrw()
    if g:NetrwIsOpen
      let i = bufnr("$")
      wh (i >= 1)
          if (getbufvar(i, "&filetype") == "netrw")
              silent exe "bw" . i
          en
          let i-=1
      endw
      let g:NetrwIsOpen=0
    el
      let g:NetrwIsOpen=1
      silent Le
      silent vert res 25
    en
endfu

aug MyNetrwSettings
    au!
    au FileType netrw nn <buffer> s <Nop>
    au FileType netrw nn <buffer> <Tab> <Nop>
    au FileType netrw nn <buffer> <S-Tab> <Nop>
    au FileType netrw nn <buffer> <c-a> <HOME>
    au FileType netrw nn <buffer> <c-e> <END>
    au FileType netrw nn <buffer> <c-p> <Up>
    au FileType netrw nn <buffer> <c-n> <Down>
    au FileType netrw nn <buffer> <c-b> <Left>
    au FileType netrw nn <buffer> <c-f> <Right>
    au FileType netrw nn <buffer> > <c-w>2>
    au FileType netrw nn <buffer> < <c-w>2<
    au FileType netrw let g:NetrwIsOpen=1
    au FileType netrw vert silent res 25
aug END

let g:QuickfixIsOpen=0
fu! ToggleQuickfix()
    if g:QuickfixIsOpen
      let i = bufnr("$")
      wh (i >= 1)
          if (getbufvar(i, "&filetype") == "qf")
              silent exe "bw" . i
          en
          let i-=1
      endw
      let g:QuickfixIsOpen=0
    el
      let g:QuickfixIsOpen=1
      silent cope
      silent res 10
    en
endfu

aug MyQuickfixSettings
    au!
    au FileType qf nn <buffer> <Tab> <Nop>
    au FileType qf nn <buffer> <S-Tab> <Nop>
    au FileType qf nn <buffer> <CR> <CR>
    au FileType qf let g:QuickfixIsOpen=1
    au FileType qf silent res 10
aug END

hi NonText ctermbg=NONE guibg=NONE
fu! NextNonQuickfix()
  let curbuf = bufnr('%')
  exe 'bn'
  wh &buftype == 'quickfix'
  exe 'bn'
    if bufnr('%') == curbuf
      brea
    end
  endw
endf

fu! PrevNonQuickfix()
  let curbuf = bufnr('%')
  exe 'bp'
  wh &buftype == 'quickfix'
  exe 'bp'
    if bufnr('%') == curbuf
      brea
    end
  endw
endf

aug QuickFixCmd
  au!
  au QuickFixCmdPost *grep* cwindow
aug END

fu! s:c_cycle(count) abort
  let qf_info = getqflist({ 'idx': 0, 'size': 0 })
  let size = qf_info->get('size')
  if size == 0
    retu
  end
  let idx = qf_info->get('idx')
  let num = (idx + size + a:count) % size
  if num == 0
    let num = size
  end
  exe num .. 'cc'
endf

com! -nargs=1 CCycle call s:c_cycle(<q-args>)

aug HighlightSpaces
  au!
  au VimEnter,WinEnter,BufWinEnter,ColorScheme * hi Spaces cterm=underline ctermfg=244 ctermfg=244
  au VimEnter,WinEnter,BufWinEnter * match Spaces /^\s\+\|\s\+$/
aug END

aug FileTypeComments
    au!
    au FileType python,sh,csh,tcsh,ruby,lua,perl,tmux,make let b:comment_string = "# "
    au FileType vim let b:comment_string = '" '
    au FileType spice let b:comment_string = '* '
    au FileType verilog,verilogams,systemverilog let b:comment_string = '\/\/ '
aug END

fu! ToggleComment()
    if !exists("b:comment_string")
        let b:comment_string = "# "
    end

    let l:comment = b:comment_string
    let l:uncomment_pattern = '^\s*' . escape(l:comment, '/*')

    if getline("'<") =~ l:uncomment_pattern
        exe "'<,'>s/" . l:uncomment_pattern . "//"
    el
        exe "'<,'>s/^/" . l:comment . "/"
    end
endf

fu! ToggleLineComment()
    if !exists("b:comment_string")
        let b:comment_string = "# "
    end

    let l:comment = b:comment_string
    let l:uncomment_pattern = '^\s*' . escape(l:comment, '/*')

    if getline('.') =~ l:uncomment_pattern
        execute "silent! s/" . l:uncomment_pattern . "//"
    el
        execute "silent! s/^/" . l:comment . "/"
    end
endf

aug vimrcEx
  au!
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | en
aug END

aug source-vimrc
  au!
  au BufWritePost *vimrc so $MYVIMRC | se fdm=manual
aug END

