local lspconfig = require('lspconfig')

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Prepare format on save
local lspformat = require("lsp-format")
lspformat.setup {}
local on_attach = function(client, bufnr)
    lspformat.on_attach(client, bufnr)
end

-- Configure all the language servers
local servers = {'clangd', 'rust_analyzer', "gopls"}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end
lspconfig["pyright"].setup {
  capabilities = capabilities,
  flake8 = {enabled = true}
}

