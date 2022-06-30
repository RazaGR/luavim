-- Load LuaVim plugins
local plugins = require"luavim.plugins"
-- neovim config path

-- If packer is not installed, install it
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end
-- Load packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end
-- Initialize packer
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
-- Start packer
return packer.startup(function(use)
  -- default plugins
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "moll/vim-bbye"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "kyazdani42/nvim-web-devicons"
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "ray-x/lsp_signature.nvim"

  -- Load plugins use 
  for i = 1, #plugins do
    local load = assert(loadfile(vim.fn.getcwd().."/lua/luavim/"..plugins[i] .."/use.lua"))
    load(use)
  end

  -- Load plugins configuration
  for i = 1, #plugins do
    require("luavim."..plugins[i] )
  end
  -- Bootstrap packer
  if PACKER_BOOTSTRAP then
      require("packer").sync()
  end
end)
