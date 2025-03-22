-- ~/.config/nvim/lua/plugins/lsp.lua
-- LSP configurations

local lspconfig = require('lspconfig')

-- Set up lsp_signature
require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})

-- Set up LSP servers
local servers = { 'pyright', 'clangd', 'rust_analyzer', 'texlab' }
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Create autocommand for LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { noremap=true, silent=true, buffer=ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
  end,
})
