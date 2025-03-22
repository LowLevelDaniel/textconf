" ~/.config/nvim/vim/autocommands.vim
" Autocommands

" =============================================================================
" ===                        AUTOCOMMANDS                                   ===
" =============================================================================

" Automatically switch to insert mode when entering a terminal buffer
autocmd TermOpen * startinsert

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Format on save for certain filetypes
autocmd BufWritePre *.py,*.c,*.cpp,*.h,*.hpp,*.rs lua vim.lsp.buf.format()

" Goyo integration with Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Automatically reload init.vim when it is saved
autocmd BufWritePost init.vim source %

" Set spelling for certain file types
autocmd FileType markdown,tex,text setlocal spell spelllang=en_us

" Detect file types
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Enhanced markdown folding 
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal foldmethod=expr
autocmd FileType markdown setlocal foldexpr=MarkdownLevel()

" Function to determine fold level for markdown
function! MarkdownLevel()
    let h = matchstr(getline(v:lnum), '^#\+')
    if empty(h)
        return "="
    else
        return ">" . len(h)
    endif
endfunction
