require "astatt.keys"
require "astatt.options"
require "astatt.plugins"

-- Plugins
require "astatt.colorscheme"
require "astatt.telescope"
require "astatt.cmp"
require "astatt.lsp"
--require "astatt.rust-tools"
require "astatt.treesitter"
require "astatt.autopairs"
require "astatt.gitsigns"
require "astatt.nvim-tree"

if vim.fn.exists('g:vscode') ~= 0 then
  require "astatt.vscode.settings"
end


