local wk = require("which-key")
local dap = require("dap")
local dapui = require("dapui")

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
  d = { 
    name = "Debugger",
    u = { dapui.toggle, "Open UI"},
    b = { dap.toggle_breakpoint, "Toggle Breakpoint"},
    c = { dap.continue, "Continue/Start"},
    t = { dap.terminate, "Terminate"},
    s = { dap.step_into, "Step Into"},
    n = { dap.step_over, "Next"},
    o = { dap.step_out, "Step Out"},
  },
  D = { 
    name = "Diagnostics",
    l = {"<cmd>Telescope diagnostics<cr>", "List"},
    s = { vim.diagnostic.open_float, "Show"},
  },
  s = {
    function()
      local lsp_format = require("lsp-format")
      local disabled = lsp_format.disabled
      lsp_format.disable({args = ""})
      vim.api.nvim_command('write')
      if not disabled then
        lsp_format.enable({args = ""})
      end
    end,
    "Save without formatting"
  },
}, { prefix = "<leader>" })
