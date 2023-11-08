call plug#begin()
Plug 'rhysd/clever-f.vim'
Plug 'unblevable/quick-scope'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

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

autocmd BufWritePre <buffer> LspDocumentFormatSync
let g:lsp_diagnostics_echo_cursor = 1

" syncomplete の設定
" オートコンプリートを有効化
let g:asyncomplete_auto_start = 1

" オートコンプリートのポップアップメニューの表示を設定
set completeopt=menuone,noinsert,noselect

" タブで補完候補を選択
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" LSP のソースを asyncomplete に登録
au User lsp_setup call asyncomplete#register_source({
    \ 'name': 'lsp',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor':function('asyncomplete#sources#lsp#completor'),
    \ })
