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

" 見た目
set number
set ruler
set cursorline
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
nnoremap H 10<left>
nnoremap J 10<down> 
nnoremap K 10<up> 
nnoremap L 10<right> 
let mapleader = "\<space>"
syntax on

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
 
inoremap jj <Esc>
:colorscheme molokai
set t_Co=256
set wrap
set linebreak
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
command Vter vert terminal
command Hter bo terminal++rows=10

map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

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
