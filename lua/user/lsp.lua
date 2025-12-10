-- Autoinstalling lsp
require("mason").setup()
require("mason-lspconfig").setup()


-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Prepare format on save
local lspformat = require("lsp-format")
lspformat.setup {}
local on_attach = function(client, bufnr)
  lspformat.on_attach(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, nil)
  end
end

-- Configure all the language servers
local servers = {
  'clangd', -- c, c++
  "marksman", -- markdown
  "dartls" -- dart
}
for _, lsp in ipairs(servers) do
  vim.lsp.config[lsp] = {
    capabilities = capabilities,
    on_attach = on_attach
  }
  vim.lsp.enable(lsp)
end

vim.lsp.config["pyright"] = {
  capabilities = capabilities,
  flake8 = {enabled = true}
}
vim.lsp.enable("pyright")

vim.lsp.config["rust_analyzer"] = {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
}
vim.lsp.enable("rust_analyzer")

vim.lsp.config["gopls"] = {
    on_attach = on_attach,
    settings = {
      gopls = {
        ["ui.inlayhint.hints"] = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true
        },
      },
    },
 }
vim.lsp.enable("gopls")
