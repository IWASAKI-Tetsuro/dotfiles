" vim-plug
if executable('git')
  call plug#begin()
  Plug 'easymotion/vim-easymotion'
  Plug 'rhysd/clever-f.vim'
  Plug 'unblevable/quick-scope'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  call plug#end()
endif

" setting
set fenc=urf-8
set nobackup
set noswapfile
set nocompatible
set wildmenu
set autoread
set hidden
set showcmd
set virtualedit=onemore

" 見た目
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
nmap <Esc><Esc> :nohlsaerch<CR><Esc>
 
:colorscheme elflord
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

" normal mode mapping
nnoremap x "_x
nnoremap X "_X
nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap H 10<left>
nnoremap J 10<down> 
nnoremap K 10<up> 
nnoremap L 10<right> 
" visual mode mapping
vnoremap x "_x
vnoremap X "_X
vnoremap H 10<left>
vnoremap J 10<down> 
vnoremap K 10<up> 
vnoremap L 10<right> 
vnoremap v <C-v>
" insert mode mapping
inoremap jj <Esc>

" easy motion mapping
let mapleader = "\<space>"
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" lsp settings
autocmd BufWritePre <buffer> LspDocumentFormatSync
" JK motions: Line motions
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_start = 1
if v:version >= 800
set completeopt=menuone,noinsert,noselect
endif
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" LSP のソースを asyncomplete に登録
au User lsp_setup call asyncomplete#register_source({
  \ 'name': 'lsp',
  \ 'whitelist': ['*'],
  \ 'priority': 10,
  \ 'completor':function('asyncomplete#sources#lsp#completor'),
  \ })
