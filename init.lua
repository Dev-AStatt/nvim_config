

require "astatt.keys"
require "astatt.options"
require "astatt.plugins"
require "astatt.colorscheme"


if vim.fn.exists('g:vscode') ~= 0 then
  require "astatt.vscode.settings"
end




