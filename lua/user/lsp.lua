local lspconfig = require('lspconfig')

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure all the language servers
local servers = {'clangd', 'rust_analyzer', 'pyright'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end
