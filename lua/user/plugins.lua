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
  }
})


