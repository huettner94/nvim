local dap = require("dap")

-- Adapters
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

-- Configurations
dap.configurations.c = {
  {
    type = "gdb",
    name = "Debug current file",
    request = "launch",
    program = "${file}",
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    type = "gdb",
    name = "Debug some program",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}

-- Go Plugin
require('dap-go').setup()

-- UI
local dapui = require("dapui")
dapui.setup()

-- Autoopen/close UI on start/end
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

