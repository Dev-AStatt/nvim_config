local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim"              -- Have packer manage itself
  use "nvim-lua/popup.nvim"                 -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"               -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs"               -- AutoPairs, generates the other () when typing
  use "akinsho/bufferline.nvim"             -- plugin to view open buffers in the top bar
  use "moll/vim-bbye"                       -- this lets it integrate with other plugins
  use "akinsho/toggleterm.nvim"             -- toggle terminal plugin 

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }


  use 'nvim-telescope/telescope.nvim'         -- FZF
  use 'eddyekofo94/gruvbox-flat.nvim'       -- Colorscheme

  -- cmp plugins
  use "hrsh7th/nvim-cmp"                    -- The completion plugin
  use "hrsh7th/cmp-buffer"                  -- buffer completions
  use "hrsh7th/cmp-path"                    -- path completions
  use "hrsh7th/cmp-cmdline"                 -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"            -- snippet completions 
  use "hrsh7th/cmp-nvim-lsp"                -- completion plugin for lsp

  -- snippits
  use "L3MON4D3/luaSnip"                    -- Snippet engine
  use "rafamadriz/friendly-snippets"        -- a bunch of snippets to use

  -- LSP 
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"     -- Simple to use language server installer
  use "simrat39/rust-tools.nvim"            -- I may remove this, it doesnt seem to do anything
  use "RishabhRD/lspactions"                -- popup for renaming

-- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",      -- Treesitter is a better syntax heighlighter
    run = "TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"                -- Treesitter-Rainbow is coloring for {} pairs

  use "lewis6991/gitsigns.nvim"             -- Get integration

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)






