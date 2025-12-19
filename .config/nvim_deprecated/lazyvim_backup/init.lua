local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('user.options')
load('user.commands')
load('user.keymaps')
require('user.plugins')

pcall(vim.cmd.colorscheme, 'catppuccin')
