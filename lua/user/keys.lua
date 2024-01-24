local wk = require("which-key")

wk.register({
  f = {
    name = "File", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    g = { "<cmd>Telescope live_grep<cr>", "Grep" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }
  },
  g = {
    name = "Goto",
    D = { vim.lsp.buf.declaration, "Declaration" },
    d = { vim.lsp.buf.definition, "Definition" },
    i = { vim.lsp.buf.implementation, "Implementation" },
    r = { "<cmd>Telescope lsp_references<cr>", "References" },
  },
  r = {
    name = "Repo",
    c = { "<cmd>Telescope git_commits<cr>", "Commits" },
    b = { "<cmd>Telescope git_branches<cr>", "Branches" },
  },
}, { prefix = "<leader>" })
