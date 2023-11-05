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
  }
})


