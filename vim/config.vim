set nocompatible

filetype plugin indent on

syntax on

set autoindent
set autoread
set background=dark
set backspace=2
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview
set copyindent
set cpo+=J
set expandtab
set formatoptions+=l
set formatoptions+=n
set hidden
set history=1024
set ignorecase
set incsearch
set laststatus=2
set linebreak
set magic
set mat=1
set modelines=0
set nobackup
set nolazyredraw
set nolist
set nostartofline
set noswapfile
set nowritebackup
set number
set omnifunc=syntaxcomplete#Complete
set pumheight=5
set report=0
set ruler
set shiftround
set shiftwidth=2
set shortmess=filtIoOA
set showmatch
set smartindent
set smarttab
set softtabstop=2
set suffixesadd=.rb,.js
set tabstop=4
set textwidth=79
set timeoutlen=200
set undodir=~/.vim/tmp/undo//
set undofile
set visualbell
set whichwrap+=<,>,h,l,[,]
set wildmenu
set wildmode=list:longest,full
set wrap
set wrapmargin=4

silent! colorscheme base16-default

if !isdirectory($HOME . '/.vim/tmp/undo')
  :silent !mkdir -p ~/.vim/tmp/undo &> /dev/null
endif

if !has('gui_running')
  set term=$TERM
endif
