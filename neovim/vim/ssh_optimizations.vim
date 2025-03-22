" ~/.config/nvim/vim/ssh_optimizations.vim
" SSH-specific optimizations

" =============================================================================
" ===                        SSH OPTIMIZATIONS                              ===
" =============================================================================

" Reduce updatetime for faster response in SSH sessions
set updatetime=200

" Disable fancy UI elements for SSH sessions that might cause lag
if $SSH_CONNECTION != ""
  set lazyredraw
  set nocursorline
  set nocursorcolumn
  set norelativenumber
  set foldmethod=manual
  set signcolumn=yes:1
endif
