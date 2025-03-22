" ~/.config/nvim/vim/keymaps.vim
" Key mappings

" =============================================================================
" ===                           KEY MAPPINGS                                ===
" =============================================================================

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows with arrows
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Move text up and down
vnoremap <A-j> :m .+1<CR>==
vnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

" Stay in indent mode
vnoremap < <gv
vnoremap > >gv

" Better ESC
inoremap jk <ESC>
inoremap kj <ESC>

" No arrow keys - force use of hjkl
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Clear search highlighting
nnoremap <leader>/ :nohlsearch<CR>

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fp <cmd>Telescope projects<cr>
nnoremap <leader>fr <cmd>Telescope oldfiles<cr>

" File explorer
nnoremap <leader>e <cmd>NvimTreeToggle<cr>

" Sessions
nnoremap <leader>ss <cmd>lua require("persistence").load()<cr>
nnoremap <leader>sl <cmd>lua require("persistence").load({ last = true })<cr>
nnoremap <leader>sd <cmd>lua require("persistence").stop()<cr>

" Debugging
nnoremap <leader>db <cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <leader>dc <cmd>lua require'dap'.continue()<CR>
nnoremap <leader>di <cmd>lua require'dap'.step_into()<CR>
nnoremap <leader>do <cmd>lua require'dap'.step_over()<CR>
nnoremap <leader>dO <cmd>lua require'dap'.step_out()<CR>
nnoremap <leader>dr <cmd>lua require'dap'.repl.toggle()<CR>
nnoremap <leader>dl <cmd>lua require'dap'.run_last()<CR>
nnoremap <leader>du <cmd>lua require'dapui'.toggle()<CR>
nnoremap <leader>dt <cmd>lua require'dap'.terminate()<CR>

" Enhanced navigation
nnoremap <leader>so <cmd>SymbolsOutline<CR>

" Delete current file and buffer
command! DeleteFile lua DeleteCurrentFile()
nnoremap <leader>df :DeleteCurrentFile<CR>

" Force write file even if it doesn't exist yet
command! FW execute 'silent! !mkdir -p %:h' | write

" Create new file from current buffer
command! -nargs=1 NewFile execute 'saveas' <q-args> | edit <args>
nnoremap <leader>nf :NewFile 

" Replace current file with clipboard contents
command! ReplaceWithClipboard %delete | put | 1delete
nnoremap <leader>rp :ReplaceWithClipboard<CR>
