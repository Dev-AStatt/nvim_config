

require "astatt.keys"
require "astatt.functions"
require "astatt.settings"


if vim.fn.exists('g:vscode') ~= 0 then
  require "astatt.vscode.settings"
end




