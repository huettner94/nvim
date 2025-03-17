local wk = require("which-key")
local dap = require("dap")
local dapui = require("dapui")

function save_no_format()
  local lsp_format = require("lsp-format")
  local disabled = lsp_format.disabled
  lsp_format.disable({args = ""})
  vim.api.nvim_command('write')
  if not disabled then
    lsp_format.enable({args = ""})
  end
end

wk.add({
  { "<leader>D", group = "Diagnostics" },
  { "<leader>Dl", "<cmd>Telescope diagnostics<cr>", desc = "List" },
  { "<leader>Ds", vim.diagnostic.open_float, desc = "Show" },

  { "<leader>c", group = "Code" },
  { "<leader>ca", vim.lsp.buf.code_action, desc = "Actions" },
  { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },

  { "<leader>d", group = "Debugger" },
  { "<leader>db", dap.toggle_breakpoint, desc = "Toggle Breakpoint" },
  { "<leader>dc", dap.continue, desc = "Continue/Start" },
  { "<leader>dn", dap.step_over, desc = "Next" },
  { "<leader>do", dap.step_out, desc = "Step Out" },
  { "<leader>ds", dap.step_into, desc = "Step Into" },
  { "<leader>dt", dap.terminate, desc = "Terminate" },
  { "<leader>du", dapui.toggle, desc = "Open UI" },

  { "<leader>f", group = "File" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },

  { "<leader>g", group = "Goto" },
  { "<leader>gD", vim.lsp.buf.declaration, desc = "Declaration" },
  { "<leader>gd", vim.lsp.buf.definition, desc = "Definition" },
  { "<leader>gi", vim.lsp.buf.implementation, desc = "Implementation" },
  { "<leader>gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },

  { "<leader>r", group = "Repo" },
  { "<leader>rb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
  { "<leader>rc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },

  { "<leader>s", save_no_format, desc = "Save without formatting" },

  { "<leader>t", "<cmd>NvimTreeToggle<cr>", desc = "File Tree" },
})
