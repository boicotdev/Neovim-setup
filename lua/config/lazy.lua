-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  require("config.ui"),
  require("config.formatter"),
  require("config.dap"),
  require("config.completion"),
  require("config.lsp"),
  require("config.explorer"),
  require("plugins.telescope"),
  require("plugins.gitsigns"),
  require("plugins.treesitter"),
})
