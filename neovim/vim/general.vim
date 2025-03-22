" ~/.config/nvim/vim/general.vim
" General settings

" =============================================================================
" ===                         GENERAL SETTINGS                              ===
" =============================================================================

" Basic Settings
set encoding=utf-8              " Set encoding to UTF-8
set fileencoding=utf-8          " Set file encoding to UTF-8
set termguicolors               " Enable true color support
set hidden                      " Allow buffer switching without saving
set number                      " Show line numbers
set relativenumber              " Show relative line numbers
set cursorline                  " Highlight current line
set showmatch                   " Highlight matching brackets
set ignorecase                  " Ignore case when searching
set smartcase                   " Except when using capital letters
set incsearch                   " Show search matches as you type
set hlsearch                    " Highlight search matches
set mouse=a                     " Enable mouse in all modes
set scrolloff=8                 " Keep 8 lines above/below cursor
set sidescrolloff=8             " Keep 8 columns to the left/right of cursor
set splitbelow                  " Split below
set splitright                  " Split to the right
set clipboard+=unnamedplus      " Use system clipboard
set updatetime=300              " Faster completion
set timeoutlen=500              " Faster key sequence completion
set wildmenu                    " Better command-line completion
set wildmode=longest:full,full  " Complete to longest common string, then full match
set completeopt=menu,menuone,noselect  " Better completion experience
set signcolumn=yes              " Always show sign column
set conceallevel=0              " Don't hide markdown syntax
set pumheight=10                " Make popup menu smaller
set lazyredraw                  " Don't redraw while executing macros
set synmaxcol=200               " Only highlight the first 200 columns

" Indentation
set expandtab                   " Tabs are spaces
set tabstop=4                   " Tab is 4 spaces
set softtabstop=4               " Tab in insert mode is 4 spaces
set shiftwidth=4                " Indentation is 4 spaces
set smartindent                 " Smart indentation
set smarttab                    " Smart tab
set autoindent                  " Auto indent

" No backup files
set nobackup                    " No backup
set nowritebackup               " No backup while editing
set noswapfile                  " No swap file

" History and undo
set history=1000                " More command history
set undofile                    " Persistent undo
set undodir=~/.config/nvim/undodir  " Where to store undo files

" Performance
set lazyredraw                  " Don't redraw while executing macros
set ttyfast                     " Faster terminal connection

" Leader key
let mapleader = " "             " Set leader key to space
let maplocalleader = ","        " Set local leader key to comma

" =============================================================================
" ===                        COLORSCHEME SETTINGS                           ===
" =============================================================================

" Set colorscheme
colorscheme tokyonight
