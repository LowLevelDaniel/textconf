" ~/.config/nvim/vim/language/markdown.vim
" Markdown specific settings

" =============================================================================
" ===                       MARKDOWN CONFIGURATION                          ===
" =============================================================================

" Markdown Configuration
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_disabled = 0  " Enable folding (was disabled)
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1

" Markdown preview settings
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

" Table Mode
let g:table_mode_corner='|'

" Markdown mappings
autocmd FileType markdown noremap <leader>mp <cmd>MarkdownPreview<CR>
autocmd FileType markdown noremap <leader>ms <cmd>MarkdownPreviewStop<CR>
autocmd FileType markdown noremap <leader>mt <cmd>TableModeToggle<CR>
autocmd FileType markdown noremap <leader>mg <cmd>Goyo<CR>
autocmd FileType markdown noremap <leader>ml <cmd>Limelight!!<CR>
