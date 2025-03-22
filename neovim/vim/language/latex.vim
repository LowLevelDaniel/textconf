" ~/.config/nvim/vim/language/latex.vim
" LaTeX specific settings

" =============================================================================
" ===                         LATEX CONFIGURATION                           ===
" =============================================================================

" VimTeX Configuration
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_quickfix_mode = 0
let g:tex_conceal = ''
let g:vimtex_fold_enabled = 1
let g:vimtex_format_enabled = 1

" LaTeX mappings
autocmd FileType tex noremap <leader>ll <cmd>VimtexCompile<CR>
autocmd FileType tex noremap <leader>lv <cmd>VimtexView<CR>
autocmd FileType tex noremap <leader>lc <cmd>VimtexClean<CR>
autocmd FileType tex noremap <leader>le <cmd>VimtexErrors<CR>
autocmd FileType tex noremap <leader>lt <cmd>VimtexTocToggle<CR>
