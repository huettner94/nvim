local wk = require("which-key")

wk.register({
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    g = { "<cmd>Telescope live_grep<cr>", "Grep" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }
  },
  g = {
    name = "goto",
    D = { vim.lsp.buf.declaration, "Declaration" },
    d = { vim.lsp.buf.definition, "Definition" },
    i = { vim.lsp.buf.implementation, "Implementation" },
    r = { vim.lsp.buf.references, "References" },
  },
}, { prefix = "<leader>" })
