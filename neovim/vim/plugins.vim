" ~/.config/nvim/vim/plugins.vim
" Plugin management

" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugin section starts
call plug#begin('~/.local/share/nvim/plugged')

" =============================================================================
" ===                       DEVELOPMENT PLUGINS                             ===
" =============================================================================

" LSP support
Plug 'neovim/nvim-lspconfig'              " LSP configuration
Plug 'hrsh7th/nvim-cmp'                  " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp'              " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'                " Buffer source for nvim-cmp
Plug 'hrsh7th/cmp-path'                  " Path source for nvim-cmp
Plug 'hrsh7th/cmp-cmdline'               " Cmdline source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip'          " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip'                  " Snippets plugin
Plug 'rafamadriz/friendly-snippets'      " Snippet collection
Plug 'ray-x/lsp_signature.nvim'          " Function signature while typing

" Fuzzy finder and file navigation
Plug 'nvim-lua/plenary.nvim'             " Lua functions used by many plugins
Plug 'nvim-telescope/telescope.nvim'     " Fuzzy finder
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'      " Icons for telescope
Plug 'kyazdani42/nvim-tree.lua'          " File explorer

" Code highlighting & indentation
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim', { 'tag': 'v2.20.8' }
Plug 'numToStr/Comment.nvim'             " Smart commenting
Plug 'windwp/nvim-autopairs'             " Auto pairs for brackets

" Git integration
Plug 'lewis6991/gitsigns.nvim'           " Git signs in gutter
Plug 'tpope/vim-fugitive'                " Git commands in nvim
Plug 'sindrets/diffview.nvim'            " Git diff viewer

" Terminal integration
Plug 'akinsho/toggleterm.nvim'           " Better terminal integration

" Debugging
Plug 'mfussenegger/nvim-dap'             " Debug Adapter Protocol
Plug 'nvim-neotest/nvim-nio'            " Required dependency for nvim-dap-ui
Plug 'rcarriga/nvim-dap-ui'              " UI for DAP
Plug 'theHamsta/nvim-dap-virtual-text'   " Virtual text for DAP

" =============================================================================
" ===                     SCIENTIFIC ENVIRONMENT PLUGINS                    ===
" =============================================================================

" LaTeX support
Plug 'lervag/vimtex'                     " Comprehensive LaTeX support

" Markdown support
Plug 'plasticboy/vim-markdown'            " Markdown syntax highlighting
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode'         " Table creation & formatting
Plug 'dkarter/bullets.vim'                " Automatic bullet lists
Plug 'junegunn/goyo.vim'                  " Distraction-free writing
Plug 'junegunn/limelight.vim'             " Focus on current paragraph

" Bibliography support
Plug 'jalvesaq/zotcite'                  " Zotero integration

" =============================================================================
" ===                          INTERFACE PLUGINS                            ===
" =============================================================================

" Status line
Plug 'nvim-lualine/lualine.nvim'         " Status line

" Color schemes
Plug 'folke/tokyonight.nvim'             " Tokyo Night color scheme
Plug 'EdenEast/nightfox.nvim'            " Nightfox color schemes
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Startup
Plug 'goolord/alpha-nvim'                " Dashboard

" Project management
Plug 'ahmedkhalf/project.nvim'           " Project management

" Better UI
Plug 'stevearc/dressing.nvim'            " Better UI for inputs
Plug 'rcarriga/nvim-notify'              " Notification manager

" Session management
Plug 'folke/persistence.nvim'            " Session management

" =============================================================================
" ===                       SSH-FRIENDLY PLUGINS                            ===
" =============================================================================

" Better clipboard management
Plug 'ojroques/nvim-osc52'               " Copy to system clipboard in ssh sessions

" Low-latency settings
Plug 'lewis6991/impatient.nvim'          " Faster startup

" =============================================================================
" ===                       NAVIGATION ENHANCEMENT PLUGINS                  ===
" =============================================================================

" Enhanced navigation
Plug 'simrat39/symbols-outline.nvim'        " Code outline/structure view
Plug 'petertriho/nvim-scrollbar'            " Scrollbar with diagnostics
Plug 'kevinhwang91/nvim-hlslens'            " Enhanced search with virtual text
Plug 'lukas-reineke/headlines.nvim'         " Markdown section highlighting

call plug#end()
