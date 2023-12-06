local wk = require("which-key")

wk.register({
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    g = { "<cmd>Telescope live_grep<cr>", "Grep" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File"}
  },
}, { prefix = "<leader>" })
