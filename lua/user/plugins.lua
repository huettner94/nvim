--- autoinstall lazy for plugin management
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require("lazy").setup({
-- Colorscheme https://github.com/RRethy/nvim-base16
  {
    "RRethy/nvim-base16",
    config = function()
      vim.cmd('colorscheme base16-tomorrow-night')
    end
  },
-- WhichKey to show keyboard mappings https://github.com/folke/which-key.nvim
  {
    "folke/which-key.nvim",
    event = "VeryLazy"
  },
-- Dynamic Terminals https://github.com/akinsho/toggleterm.nvim
  {'akinsho/toggleterm.nvim', version = "*", config = true},
-- LSP Servers https://github.com/neovim/nvim-lspconfig
  {"neovim/nvim-lspconfig"},
-- Autoinstalling LSP Servers https://github.com/williamboman/mason-lspconfig.nvim
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
-- Autocompletion https://github.com/hrsh7th/nvim-cmp
  {"hrsh7th/nvim-cmp"},
-- Load autocompletion from LSP https://github.com/hrsh7th/cmp-nvim-lsp
  {"hrsh7th/cmp-nvim-lsp"},
-- Load autocompletion from paths https://github.com/hrsh7th/cmp-buffer
  {"hrsh7th/cmp-buffer"},
-- Integrate autocompletion with snippets manager https://github.com/saadparwaiz1/cmp_luasnip
  {"saadparwaiz1/cmp_luasnip"},
-- Snippet support (needed for autocompletion) https://github.com/L3MON4D3/LuaSnip
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp"
  },
-- Automatically loading .venv files https://github.com/linux-cultist/venv-selector.nvim
  {
    "linux-cultist/venv-selector.nvim",
    event = "VeryLazy",
    opts = {
      name = ".venv"
    }
  },
-- Fuzzy search and selection https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
     dependencies = { 'nvim-lua/plenary.nvim' }
  },
-- Language Parser, dependency of a bunch of things https://github.com/nvim-treesitter/nvim-treesitter
  {"nvim-treesitter/nvim-treesitter"},
-- Formatting on save https://github.com/lukas-reineke/lsp-format.nvim
  {"lukas-reineke/lsp-format.nvim"},
-- Statusline configurable in lua https://github.com/nvim-lualine/lualine.nvim-treesitter
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
-- Git highlights to changed lines https://github.com/lewis6991/gitsigns.nvim
  {"lewis6991/gitsigns.nvim"},
-- Debugging Adapter https://github.com/mfussenegger/nvim-dap
  {"mfussenegger/nvim-dap"},
-- Debugging Adapter UI https://github.com/rcarriga/nvim-dap-ui
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
-- Automagic debug adapter for go https://github.com/leoluz/nvim-dap-go
  {"leoluz/nvim-dap-go"},
-- file tree https://github.com/nvim-tree/nvim-tree.lua
  {"nvim-tree/nvim-tree.lua"},
})


