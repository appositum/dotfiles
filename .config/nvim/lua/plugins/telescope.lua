-- local Plugin = {'nvim-telescope/telescope.nvim'}
-- 
-- Plugin.tag = '0.1.4'
-- 
-- Plugin.dependencies = {
--   {'nvim-lua/plenary.nvim'},
--   {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
-- }
-- 
-- Plugin.cmd = {'Telescope'}
-- 
-- function Plugin.init()
--   -- See :help telescope.builtin
--   vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
--   vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
--   vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
--   vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
--   vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
--   vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
-- end
-- 
-- function Plugin.config()
--   require('telescope').load_extension('fzf')
-- end
-- 
-- return Plugin

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  dependencies = { 
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('telescope').setup({
      pickers = {
        buffers = {
          initial_mode = "normal"
        },
        find_files = {
          initial_mode = "normal"
        },
      }
    })
  end
}
