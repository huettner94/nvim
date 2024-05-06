require("user.options")
require("user.keymap")
require("user.plugins")
-- These configure plugins, so must be after plugins
require("user.toggleterm")
require("user.lsp")
require("user.cmp")
require("user.treesitter")
require("user.notsosafelinks")
require("user.lualine")
require("user.gitsigns")
require("user.dap")
require("user.nvimtree")
-- Configure keys at the end when all is loaded
require("user.keys")

