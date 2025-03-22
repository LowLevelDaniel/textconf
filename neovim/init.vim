" ~/.config/nvim/init.vim
" Main entry point for Neovim configuration
" This file sources all other configuration files

" Directory structure:
" ~/.config/nvim/
" ├── init.vim (this file)
" ├── vim/
" │   ├── plugins.vim        - Plugin definitions
" │   ├── general.vim        - General settings
" │   ├── keymaps.vim        - Key mappings
" │   ├── autocommands.vim   - Autocommands
" │   ├── ssh_optimizations.vim - SSH-specific settings
" │   └── language/
" │       ├── latex.vim      - LaTeX settings
" │       └── markdown.vim   - Markdown settings
" └── lua/
"     ├── plugins/
"     │   ├── lsp.lua        - LSP configurations
"     │   ├── completion.lua - Completion configurations
"     │   ├── treesitter.lua - Treesitter configurations
"     │   ├── navigation.lua - Navigation tools (telescope, etc.)
"     │   ├── git.lua        - Git integrations
"     │   ├── ui.lua         - UI elements (statusline, etc.)
"     │   ├── terminal.lua   - Terminal configuration
"     │   ├── debug.lua      - Debugging configurations
"     │   └── navigation_extras.lua - New navigation enhancements
"     └── utils.lua          - Utility functions

" Create required directories if they don't exist
if !isdirectory(expand('~/.config/nvim/vim'))
  call mkdir(expand('~/.config/nvim/vim'), 'p')
endif
if !isdirectory(expand('~/.config/nvim/vim/language'))
  call mkdir(expand('~/.config/nvim/vim/language'), 'p')
endif
if !isdirectory(expand('~/.config/nvim/lua/plugins'))
  call mkdir(expand('~/.config/nvim/lua'), 'p')
  call mkdir(expand('~/.config/nvim/lua/plugins'), 'p')
endif

" Source VimScript configurations
runtime vim/plugins.vim        " Plugin management
runtime vim/general.vim        " General settings
runtime vim/keymaps.vim        " Key mappings
runtime vim/autocommands.vim   " Autocommands
runtime vim/ssh_optimizations.vim " SSH-specific settings

" Source language-specific configurations
runtime vim/language/latex.vim
runtime vim/language/markdown.vim

" Source Lua configurations through VimScript bridges
lua require('plugins.lsp')
lua require('plugins.completion')
lua require('plugins.treesitter')
lua require('plugins.navigation')
lua require('plugins.git')
lua require('plugins.ui')
lua require('plugins.terminal')
lua require('plugins.debug')
lua require('plugins.navigation_extras')
