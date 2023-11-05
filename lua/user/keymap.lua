keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- space is the leader
keymap("", "<Space>", "<Nop>", default_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>", default_opts)

-- Toggleterm
keymap("n", "<M-1>", ":ToggleTerm 1 size=10 direction=horizontal<CR>", default_opts)
keymap("n", "<M-2>", ":ToggleTerm 2 direction=float<CR>", default_opts)
keymap("t", "<M-1>", [[<Cmd>ToggleTerm 1 size=10 direction=horizontal<CR>]], default_opts)
keymap("t", "<M-2>", [[<Cmd>ToggleTerm 2 direction=float<CR>]], default_opts)
